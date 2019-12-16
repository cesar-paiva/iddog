//
//  HomeViewController.swift
//  iddog
//
//  Created by Cesar Paiva on 12/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var category: String?
    var images = [String]()
    lazy var viewModel = HomeViewModel()
    let itemsPerRow: CGFloat = 2
    private let reuseIdentifier = "DogCell"
    
    private let spacing: CGFloat = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        configureCollectionViewLayout()
        
        viewModel.listDogs(forCategory: category) { (images, error) in
            
            self.activityIndicator.stopAnimating()
            guard let images = images else { return }
            
            self.images = images
            self.collectionView.reloadData()
            
        }
    }

    @IBAction func dogBreedValueChanged(_ sender: UISegmentedControl) {
        
        if let category = segmentedControl.titleForSegment(at: sender.selectedSegmentIndex) {
            
            activityIndicator.startAnimating()
            viewModel.listDogs(forCategory: category) { (images, error) in
                
                self.activityIndicator.stopAnimating()
                guard let images = images else { return }
                
                self.images = images
                self.collectionView.reloadData()
            }
        }
        
    }
    
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionView?.collectionViewLayout = layout
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        
        collectionViewCell.viewModel = viewModel
        collectionViewCell.setup(withImageURL: images[indexPath.row])
        
        return collectionViewCell
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerRow: CGFloat = 2
        let spacingBetweenCells = spacing
        
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        
        if let collection = self.collectionView {
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width, height: width)
        }else {
            return CGSize(width: 0, height: 0)
        }
        
    }

}
