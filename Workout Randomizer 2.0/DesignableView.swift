//
//  DesignableView.swift
//  Workout Randomizer 2.0
//
//  Created by Sheldon Coates on 2017-07-08.
//  Copyright © 2017 Sheldon Coates. All rights reserved.
//

import UIKit

@IBDesignable class DesignableView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
}
