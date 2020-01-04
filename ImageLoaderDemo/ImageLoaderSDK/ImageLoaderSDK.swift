//
//  ImageLoaderSDK.swift
//  ImageLoaderSDK
//
//  Created by Jeni on 1/4/20.
//  Copyright © 2020 Jeni. All rights reserved.
//

import UIKit

public class ImageLoaderSDK {
    
    public static var instance = ImageLoaderSDK()
    
    public func setImageWith(_ urlString: String, _ imageView: UIImageView) {
        if let url = URL(string: urlString), let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
            DispatchQueue.main.async {
                imageView.image = image
            }
        }
    }
}
