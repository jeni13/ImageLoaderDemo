//
//  ViewController.swift
//  ImageLoaderDemo
//
//  Created by Jeni on 1/4/20.
//  Copyright © 2020 Jeni. All rights reserved.
//

import UIKit

// MARK: - ImageLoaderViewController
class ImageLoaderViewController: UIViewController {
   
    @IBOutlet weak var collectionView: UICollectionView!
    let cellIdentifier = "ImageLoaderCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
    }
    
    private func registerNib() {
        self.collectionView.register(UINib(nibName: cellIdentifier, bundle: nil),
                                     forCellWithReuseIdentifier: cellIdentifier)
    }
}

extension ImageLoaderViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}

extension ImageLoaderViewController: UICollectionViewDelegate {
    
}
