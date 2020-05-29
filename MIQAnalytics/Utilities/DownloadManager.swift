//
//  DownloadManager.swift
//  
//
//  Created by imgadmin on 13/08/19.
//  Copyright © 2019 Wipro. All rights reserved.
//

import UIKit

struct Defaults {
  private static let userDefault = UserDefaults.standard
    
   static func save(_ name: String, address: String){
    userDefault.set(name, forKey: "name")
    userDefault.set(address, forKey: "address")
    
       
    }
    
    /**
     - Description - Fetching Values via Model `UserDetails` you can use it based on your uses.
     - Output - `UserDetails` model
     */
    static func getName() -> String  {
        return  userDefault.string(forKey: "name")!
    }
    
    static func getaddress() -> String  {
          return  userDefault.string(forKey: "address")!
      }
    
    /**
        - Description - Clearing user details for the user key `com.save.usersession`
     */
    static func clearUserData(){
        userDefault.removeObject(forKey: "name")
        userDefault.removeObject(forKey: "address")
    }
    
}


class DownloadManager: NSObject {
    
    static public let downloadmanager = DownloadManager()
    
    public override init() {
        
    }
    
    public func downloadImage(imageUrl:String, completion: @escaping (UIImage?)->()) {
        let url = URL(string: imageUrl)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            guard let imgData = data else {
               // print("No data")
                return
            }
            let image = UIImage(data: imgData)
            completion(image)
        }).resume()
    }

}
