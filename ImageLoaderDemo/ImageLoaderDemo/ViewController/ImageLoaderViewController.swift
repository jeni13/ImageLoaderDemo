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
    @IBOutlet weak var containerView: UIVisualEffectView!
    @IBOutlet weak var largeImageView: UIImageView!

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
    @IBAction func closeClicked(_ sender: UIButton) {
        self.largeImageView.image = nil
        self.containerView.isHidden = true
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
        DispatchQueue.global().async {
            self.presenter.getImageForIndex(indexPath.row) { (data) in
                DispatchQueue.main.async {
                    cell.downloadedImageView.image = UIImage(data: data)
                    //                cell.layoutIfNeeded()
                    collectionView.layoutIfNeeded()
                }
            }
        }
        return cell
    }
    
    
}
// MARK: - Collection View delegate
extension ImageLoaderViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ImageLoaderCollectionViewCell {
            self.containerView.isHidden = false
            self.largeImageView.image = cell.downloadedImageView.image
        }
    }
}

extension ImageLoaderViewController: UICollectionViewDelegateFlowLayout {
 
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: self.view.frame.width, height: self.view.frame.width)
  }
}
