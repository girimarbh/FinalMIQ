//
//  DrillNewtworkManager.swift
//  MIQAnalytics
//
//  Created by Girish on 03/03/20.
//  Copyright © 2020 Girish. All rights reserved.
//

import UIKit

//https://azurewebapiwiprodevelopment.azurewebsites.net/api/managementview?id=2&plantid=Reedsville&kpiid=21

struct Constants3 {
    
    struct APIDetails {
        static let APIScheme = "https"
        static let APIHost = "azurewebapiwiprodevelopment.azurewebsites.net"
        static let APIPath = "/api/mpd"
    }
    
    struct APIDetailsmanagementView {
           static let APIScheme = "https"
           static let APIHost = "azurewebapiwiprodevelopment.azurewebsites.net"
           static let APIPath = "/api/managementview"
       }
    
}
class DrillNewtworkManager: NSObject {
    
    var url : NSURL?
    var placearray = [Place]()
    
   private func createURLFromParameters2(parameters: [[String:Any]], pathparam: String?) -> URL {
            
            var components = URLComponents()
            components.scheme = Constants2.APIDetails.APIScheme
            components.host   = Constants2.APIDetails.APIHost
            
    //        switch item {
    //                 case .map:
    //                    print("first")
    //             components.path   = "abcccc"
    //                 case .dasboard:
    //                    print("second")
    //                     case .none:
    //                     print("third")
    //
    //
    //
    //                 case .none:
    //                     print("third")
    //             }
            
            components.path   = Constants2.APIDetails.APIPath
            if let paramPath = pathparam {
                components.path = Constants2.APIDetails.APIPath + "\(paramPath)"
            }
            if !parameters.isEmpty {
                components.queryItems = [URLQueryItem]()
                for a in parameters{
                for (key, value) in a {
                    let queryItem = URLQueryItem(name: key, value: "\(value)")
                    components.queryItems!.append(queryItem)
                }
                }
            }
            
            return components.url!
        }
    
    private func createURLFromParametersmanagementview(parameters: [[String:Any]], pathparam: String?) -> URL {
            
            var components = URLComponents()
            components.scheme = Constants3.APIDetailsmanagementView.APIScheme
            components.host   = Constants3.APIDetailsmanagementView.APIHost
            
    //        switch item {
    //                 case .map:
    //                    print("first")
    //             components.path   = "abcccc"
    //                 case .dasboard:
    //                    print("second")
    //                     case .none:
    //                     print("third")
    //
    //
    //
    //                 case .none:
    //                     print("third")
    //             }
            
            components.path   = Constants3.APIDetailsmanagementView.APIPath
            if let paramPath = pathparam {
                components.path = Constants3.APIDetailsmanagementView.APIPath + "\(paramPath)"
            }
            if !parameters.isEmpty {
                components.queryItems = [URLQueryItem]()
                for a in parameters{
                for (key, value) in a {
                    let queryItem = URLQueryItem(name: key, value: "\(value)")
                    components.queryItems!.append(queryItem)
                }
                }
            }
            
            return components.url!
        }
    
    static public let networkmanager = DrillNewtworkManager()
    
    public override init() {
        

    }
    
   // https://azurewebapiwiprodevelopment.azurewebsites.net/api/mpd?id=1&plantid=Andover&kpiid=11
    
    func retrieveAPIData(id : Int , plantid : String , Kpiid : Int , userCompletionHandler : @escaping (NSData? , NSError?) -> Void) {
      var  mail = "miqdemo@outlook.com"
      var  plantname = "Andover"
        print("the plant id in fetch data is \(plantid)")
       // var  plantname = "Fairburn"
       url = self.createURLFromParameters2(parameters: [["PLANTID" : plantid],["id" : id] , ["kpiid" : Kpiid]], pathparam: "") as NSURL
           var request: URLRequest = URLRequest(url: url! as URL)
            request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
            request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "GET"
            // Request the data
            let session: URLSession = URLSession.shared
            let task = session.dataTask(with: request) { (data, response, error) in
                // print(data!.count)
                // Did we get an error?
                guard error == nil else {
                    print(error!)
                    
                    DispatchQueue.main.async{
                        //userCompletionHandler(nil , error as NSError?)
                    }
                    
                    return
                }
                
                guard let json = data else {
                    print("No data")
                    return
                }
                userCompletionHandler(json as NSData , error as NSError?)
                  
                }
                
            
            task.resume()
        }
    
    func retrieveAPIDatamanagementview(id : Int , plantid : String , Kpiid : Int , userCompletionHandler : @escaping (NSData? , NSError?) -> Void) {
      var  mail = "miqdemo@outlook.com"
      var  plantname = "Andover"
        print("the plant id in fetch data is \(plantid)")
       // var  plantname = "Fairburn"
       url = self.createURLFromParametersmanagementview(parameters: [["PLANTID" : plantid],["id" : id] , ["kpiid" : Kpiid]], pathparam: "") as NSURL
           var request: URLRequest = URLRequest(url: url! as URL)
            request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
            request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "GET"
            // Request the data
            let session: URLSession = URLSession.shared
            let task = session.dataTask(with: request) { (data, response, error) in
                // print(data!.count)
                // Did we get an error?
                guard error == nil else {
                    print(error!)
                    
                    DispatchQueue.main.async{
                        //userCompletionHandler(nil , error as NSError?)
                    }
                    
                    return
                }
                
                guard let json = data else {
                    print("No data")
                    return
                }
                userCompletionHandler(json as NSData , error as NSError?)
                  
                }
                
            
            task.resume()
        }
    
    
   private func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

}
