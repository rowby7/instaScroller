**instaScroller**

An iOS application built in Swift that seamlessly fetches and displays your Instagram posts in a vertically scrollable table view. Designed for clarity and speed, it provides an elegant and intuitive way to browse your personal media feed right from your device

**Features**
**Instagram Integration** 
Connects to the Instagram Graph API using secure access tokens to fetch post data including captions, media URLs, timestamps, and media types.

**RESTful API Consumption** 
Efficiently implements a REST API call to retrieve authenticated user media in JSON format.

**Asynchronous Image Loading** 
Leverages the Nuke image loading library for smooth asynchronous rendering and caching of remote images.

**UITableView Layout** 
Displays your Instagram content in a dynamic, scrollable UITableView format, keeping interface performance snappy even with large media sets.

Secure Configuration Uses .xcconfig and Info.plist for managing API keys securely, avoiding hardcoded credentials in source code.

**Tech Stack**
Language: Swift
Frameworks: UIKit, Nuke
API: Instagram Graph API
Networking: URLSession + JSON Decoding

**How it Works**

* On launch, the app retrieves your access token securely from the config file.

* It makes a RESTful request to the Instagram Graph API to get your recent media.

* The response is decoded into native Swift models and rendered within a scrollable table view.

* Each cell dynamically loads and displays your image and caption using Nuke for optimal performance.
