//
//  ViewController.swift
//  instaScroller
//
//  Created by Rowby Villanueva on 7/14/25.
//

import UIKit
import Nuke
import NukeExtensions


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        
        let post = posts[indexPath.row]
        
        print("url of image for image \(indexPath.row): \(post.mediaUrl)")
      
        let mediaUrl = post.mediaUrl
        NukeExtensions.loadImage(with: mediaUrl, into: cell.postImageView)
    
        cell.caption.text = post.caption
        
        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    private var posts: [Post] = []
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
        
        fetchPosts()
    }
    
    func fetchPosts(){
        
        guard let accessToken = Bundle.main.infoDictionary?["API_KEY"] as? String else {
            fatalError("Missing API_KEY in Info.plist")
        }
        let url = URL(string:"https://graph.instagram.com/me/media?fields=id,caption,media_type,media_url,timestamp&access_token=\(accessToken)")
        let session = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data, error == nil else{
                print("Error fetching data", error?.localizedDescription ?? "unknown error")
                return
            }
            do {
                let decoder = try JSONDecoder().decode(ApiResponse.self, from: data)
               
                DispatchQueue.main.async { [weak self] in
                    
                    self?.posts = decoder.data
                    self?.tableView.reloadData()
                    
                    
                }
            } catch {
                print("Decoding error: ", error)
            }
        }
        session.resume()
    }
}
