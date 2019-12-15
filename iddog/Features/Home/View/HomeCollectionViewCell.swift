//
//  HomeCollectionViewCell.swift
//  iddog
//
//  Created by Cesar Paiva on 14/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var viewModel: HomeViewModel?
    
    func setup(withImageURL url: String) {
        
        viewModel?.downloadAndCacheImage(forURL: url, completion: { image in
            self.imageView.image = image
        })
        
    }
    
}
