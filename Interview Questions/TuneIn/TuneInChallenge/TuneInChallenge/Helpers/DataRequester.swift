//
//  DataRequester.swift
//  TuneInChallenge
//
//  Created by Brian Sakhuja on 7/27/18.
//  Copyright © 2018 Brian Sakhuja. All rights reserved.
//

import Foundation
import UIKit

class DataRequester
{
    
    @discardableResult func makeRequest(request: URLRequest, onSuccess: @escaping (Data) -> Void, onFailure: @escaping (Error) -> Void) -> URLSessionDataTask
    {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else
            {
                guard let error = error else
                {
                    preconditionFailure()
                }
                
                DispatchQueue.main.async() {
                    onFailure(error)
                }
                
                return
            }
            
            DispatchQueue.main.async {
                onSuccess(data)
            }
        }
        
        task.resume()
        return task
    }
    
//    func downloadImage(imageData: NSData) -> UIImage
//    {
////        return UIImage(data: imageData as Data)
//    }

}
