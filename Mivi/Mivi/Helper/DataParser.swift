//
//  JsonHelper.swift
//  Mivi
//
//  Created by Nadeem on 16/08/18.
//  Copyright © 2018 Sample. All rights reserved.
//

import Foundation

class DataParser {

    class func readJson() -> Any? {
        do {
            if let file = Bundle.main.url(forResource: "collection", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    print(object)
                    return object
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                    return object
                } else {
                    print("JSON is invalid")
                    return nil
                }
            } else {
                print("no file")
                return nil
            }
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    class func dataModel() -> DataModel? {
    
        if let objJson = readJson(), let jsonData = objJson as? [String: Any], let dataObj = jsonData["data"] as? [String: Any] {
            let data = JSON(dataObj)
            return DataModel(json: data)
        } else {
            return nil
        }
    }
    
    class func servicesModels() -> [Service]? {
        
        if let objJson = readJson(), let jsonData = objJson as? [String: Any], let includedObjs = jsonData["included"] as? [[String: Any]] {

            var services = [Service]()
            for includeObj in includedObjs {
                if let type = includeObj["type"] as? String, type == "services" {
                    let json = JSON(includeObj)
                    services.append(Service(json: json))
                }
            }
            return services
        } else {
            return nil
        }
    }
    
    class func subscriptionsModels() -> [Subscription]? {
        
        if let objJson = readJson(), let jsonData = objJson as? [String: Any], let includedObjs = jsonData["included"] as? [[String: Any]] {
            
            var subscriptions = [Subscription]()
            for includeObj in includedObjs {
                if let type = includeObj["type"] as? String, type == "subscriptions" {
                    let json = JSON(includeObj)
                    subscriptions.append(Subscription(json: json))
                }
            }
            return subscriptions
        } else {
            return nil
        }
    }

    class func productsModels() -> [Product]? {
        
        if let objJson = readJson(), let jsonData = objJson as? [String: Any], let includedObjs = jsonData["included"] as? [[String: Any]] {
            
            var products = [Product]()
            for includeObj in includedObjs {
                if let type = includeObj["type"] as? String, type == "products" {
                    let json = JSON(includeObj)
                    products.append(Product(json: json))
                }
            }
            return products
        } else {
            return nil
        }
    }


}
