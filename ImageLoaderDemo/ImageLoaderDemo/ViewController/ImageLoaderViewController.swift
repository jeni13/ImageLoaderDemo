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
    private let presenter = ImageLoaderPresenter()
    
    // MARK: View Controller Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
        self.presenter.setViewDelegate(delegate: self)
    }
    
    // MARK: - Registering Nib class
    private func registerNib() {
        self.collectionView.register(UINib(nibName: cellIdentifier, bundle: nil),
                                     forCellWithReuseIdentifier: cellIdentifier)
    }
}

// MARK: - Presenter delegate
extension ImageLoaderViewController: ImageLoaderDelegate {
    func reloadUIWithData() {
        self.collectionView.reloadData()
    }
}
// MARK: - Collection View datasource
extension ImageLoaderViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.getListCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ImageLoaderCollectionViewCell
        presenter.getImageForIndex(indexPath.row) { (data) in
            cell.downloadedImageView.image = UIImage(data: data)
        }
        return cell
    }
    
    
}
// MARK: - Collection View delegate
extension ImageLoaderViewController: UICollectionViewDelegate {
    
}
