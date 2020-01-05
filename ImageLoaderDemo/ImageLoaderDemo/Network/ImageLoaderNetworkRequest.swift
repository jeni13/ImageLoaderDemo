//
//  ImageLoaderNetworkRequest.swift
//  ImageLoaderDemo
//
//  Created by Jeni on 1/4/20.
//  Copyright © 2020 Jeni. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - ImageLoaderNetworkRequest
class ImageLoaderNetworkRequest {
   
    let url = "https://api.unsplash.com/photos"
    let headers = ["Authorization": "Client-ID 937634a53ef59a1151f7da9d2ea6d0dd5b24fca2aa47513f9d03aa90cc9fcdfb"]
    
    func getDataFromUnSplash(param: [String: Any?]?, completion: @escaping ([ImageLoaderModel]) -> Void) {
        Alamofire.request(url, method: .get, parameters: nil, headers: headers).responseJSON { (response) in
            if let value = response.value {
                let decoder = JSONDecoder()
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                    let data = try decoder.decode([ImageLoaderModel].self, from: jsonData)
                    completion(data)
                } catch {
                    print(error.localizedDescription)
                }
            }
            }
    }
}

