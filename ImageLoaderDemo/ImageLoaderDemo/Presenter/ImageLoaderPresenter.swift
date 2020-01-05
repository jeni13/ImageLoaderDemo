//
//  ImageLoaderPresenter.swift
//  ImageLoaderDemo
//
//  Created by Jeni on 1/4/20.
//  Copyright © 2020 Jeni. All rights reserved.
//

import ImageLoaderSDK
import Alamofire

// MARK: - To call back once we get response and update UI
protocol ImageLoaderDelegate {
    func reloadUIWithData()
}

// MARK: - ImageLoaderPresenter
class ImageLoaderPresenter {
    private var imageLoaderDelegate: ImageLoaderDelegate?
    var responseList: [ImageLoaderModel]?
    
    // MARK: - Initializer
    init() {
        getData()
    }
    
    // MARK: - Set delegate
    func setViewDelegate(delegate:ImageLoaderDelegate?){
        self.imageLoaderDelegate = delegate
    }
    
    // MARK: - API call for getting data
    func getData() {
        ImageLoaderNetworkRequest().getDataFromUnSplash(param: nil) { (data) in
            self.responseList = data
            self.imageLoaderDelegate?.reloadUIWithData()
        }
    }
    
    // MARK: - Number of images
    func getListCount() -> Int {
        return responseList?.count ?? 0
    }
    
    // MARK: - Get image from URL String
    func getImageForIndex(_ index: Int, completion: @escaping (Data)->()) {
        if let imgString = responseList?[index].urls?.small {
            ImageLoaderSDK.instance.getImageWith(imgString) { (data) in
                completion(data)
            }
        }
    }
}
