//
//  UITextFieldStub.swift
//  iddogTests
//
//  Created by Cesar Paiva on 10/12/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit

class UITextFieldStub: UITextField {
    
    init(text: String) {
        super.init(frame: CGRect.zero)
        super.text = text
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
