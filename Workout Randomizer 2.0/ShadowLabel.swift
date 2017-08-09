//
//  ShadowLabel.swift
//  Workout Randomizer 2.0
//
//  Created by Sheldon Coates on 2017-07-05.
//  Copyright © 2017 Sheldon Coates. All rights reserved.
//

import UIKit

class ShadowLabel: UILabel {
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.font = UIFont.boldSystemFont(ofSize: 17)
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0
    }
}
