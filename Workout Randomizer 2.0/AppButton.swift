//
//  AppButton.swift
//  Workout Randomizer 2.0
//
//  Created by Sheldon Coates on 2017-07-04.
//  Copyright © 2017 Sheldon Coates. All rights reserved.
//

import UIKit

class AppButton: UIButton {
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0
        self.layer.cornerRadius = 3.0
        self.layer.masksToBounds = false
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(white: 1, alpha: 0.7).cgColor
        self.titleLabel?.textColor = UIColor.white
        self.backgroundColor =  UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 0.6)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
        super.touchesBegan(touches, with: event)
    }
}
