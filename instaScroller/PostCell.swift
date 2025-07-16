//
//  PostCell.swift
//  instaScroller
//
//  Created by Rowby Villanueva on 7/14/25.
//

import UIKit

class PostCell: UITableViewCell {

   
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var caption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
