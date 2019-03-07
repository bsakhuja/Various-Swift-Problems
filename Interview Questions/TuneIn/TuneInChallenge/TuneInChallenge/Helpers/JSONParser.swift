//
//  JSONParser.swift
//  TuneInChallenge
//
//  Created by Brian Sakhuja on 7/19/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import Foundation

class JSONParser
{
//    let url: URL
    let JSONData: Data
    var jsonObjects: [JSONObject] = []
    
//    init()
//    {
//        url = URL(string: "https://opml.radiotime.com/?partnerId=9xRsEvDb&render=json")!
//    }
//
//    init(givenURL: URL)
//    {
//        url = givenURL
//    }
    
    init(data: Data)
    {
        JSONData = data
    }
    
    func parseJSON() -> [JSONObject]
    {
        do
        {
            let allJSON = try JSONSerialization.jsonObject(with: JSONData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            if let arrayJSON = allJSON["body"]
            {
                for bodyItemIndex in 0...arrayJSON.count-1
                {
                    let jsonObject = arrayJSON[bodyItemIndex] as! [String : AnyObject]
                    let jsonType = jsonObject["type"] as? String ?? ""
                    let jsonText = jsonObject["text"] as? String ?? ""
                    let jsonURL = jsonObject["URL"] as? String ?? ""
                    let jsonImage = jsonObject["image"] as? String ?? ""
                    
                    let newJSONObject = JSONObject(text: jsonText,  url: jsonURL, image: jsonImage, imageData: nil, uiImage: nil, type: jsonType)
                    jsonObjects.append(newJSONObject)
                    
                    
                }
            }
        }
        
        catch
        {
            print("error")
        }
        
        return jsonObjects
        
    }
    
    func parseJSONWithChildren() -> [JSONObject]
    {
        do
        {
            let allJSON = try JSONSerialization.jsonObject(with: JSONData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            if let arrayJSON = allJSON["body"]
            {
                for bodyItemIndex in 0...arrayJSON.count-1
                {
                    let jsonObject = arrayJSON[bodyItemIndex] as! [String : AnyObject]
                    if let jsonChildren = jsonObject["children"]
                    {
                        for childrenIndex in 0...jsonChildren.count-1
                        {
                            let jsonChildObject = jsonChildren[childrenIndex] as! [String : AnyObject]
                            let jsonChildType = jsonChildObject["type"] as? String ?? ""
                            let jsonChildText = jsonChildObject["text"] as? String ?? ""
                            let jsonChildURL = jsonChildObject["URL"] as? String ?? ""
                            let jsonChildImage = jsonChildObject["image"] as? String ?? ""
                            let newJSONObject = JSONObject(text: jsonChildText,  url: jsonChildURL, image: jsonChildImage, imageData: nil, uiImage: nil, type: jsonChildType)
                            jsonObjects.append(newJSONObject)
                        }
                    }
                }
            }
        }
            
        catch
        {
            print("error")
        }
        
        return jsonObjects
        
    }
    
    
    func parseJSONLocalRadio() -> [JSONObject]
    {
        do
        {
            let allJSON = try JSONSerialization.jsonObject(with: JSONData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            if let arrayJSON = allJSON["body"]
            {
                for bodyItemIndex in 0...arrayJSON.count - 1
                {
                    let bodyObject = arrayJSON[bodyItemIndex] as! [String : AnyObject]
                    if let children = bodyObject["children"]
                    {
                        for childrenIndex in 0...children.count - 1
                        {
                            let jsonObject = children[childrenIndex] as! [String : AnyObject]
                            let jsonText = jsonObject["text"] as! String
                            let jsonURL = jsonObject["URL"] as! String
                            let jsonType = jsonObject["type"] as! String
                            
                            let newJSONObject = JSONObject(text: jsonText,  url: jsonURL, image: nil, imageData: nil , uiImage: nil, type: jsonType)
                            
                            jsonObjects.append(newJSONObject)
                        }
                    }
                    
                    
                }
            }
        }
            
        catch
        {
            print("error")
        }
        
        return jsonObjects
        
    }
}
