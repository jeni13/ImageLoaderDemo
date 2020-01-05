//
//  ImageLoaderModel.swift
//  ImageLoaderDemo
//
//  Created by Jeni on 1/4/20.
//  Copyright © 2020 Jeni. All rights reserved.
//

import Foundation

// MARK: - ImageLoaderModel
struct ImageLoaderModel: Codable {
    let urls: Urls?
    let links: Links?
   
    enum CodingKeys: String, CodingKey {
        case urls, links
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        urls = try container.decode(Urls.self, forKey: .urls)
        links = try container.decode(Links.self, forKey: .links)
    }
}

// MARK: - Links
struct Links: Codable {
    let linksSelf, html, download, downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small, thumb: String?
}
