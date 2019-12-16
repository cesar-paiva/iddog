//
//  UICollectionViewStub.swift
//  iddogTests
//
//  Created by Cesar Paiva on 15/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit

class UICollectionViewStub: UICollectionView {
    
    init() {
        super.init(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

