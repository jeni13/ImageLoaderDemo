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
    
    // MARK: - Check if image data is cached or get the image data
    public func getImageWith(_ urlString: String, completion: @escaping (Data) -> Void) {
        if let cachedData = UserDefaults.standard.data(forKey: urlString) {
            completion(cachedData)
        } else {
            if let url = URL(string: urlString), let data = try? Data(contentsOf: url) {
                UserDefaults.standard.set(data, forKey: urlString)
                completion(data)
            }
        }
    }
    
    // MARK: - For removing single cached data (For future scope)
    public func removeCachedImageFor(imageString: String) {
        UserDefaults.standard.removeObject(forKey: imageString)
    }
    
    // MARK: - For Removing all cached images once we dont required
    public func removeAllCachedImages() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        
    }
}
