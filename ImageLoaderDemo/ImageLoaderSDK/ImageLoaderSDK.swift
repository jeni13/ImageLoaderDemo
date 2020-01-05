//
//  ImageLoaderSDK.swift
//  ImageLoaderSDK
//
//  Created by Jeni on 1/4/20.
//  Copyright © 2020 Jeni. All rights reserved.
//

import Foundation

// MARK: - ImageLoaderSDK
public class ImageLoaderSDK {
    
    public static var instance = ImageLoaderSDK()
    
    public func getImageWith(_ urlString: String, completion: (Data) -> Void) {
        if let url = URL(string: urlString), let data = try? Data(contentsOf: url) {
            completion(data)
        }
    }
}
