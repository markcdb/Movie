//
//  ViewHelper.swift
//  Movie
//
//  Created by Mark Christian Buot on 04/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation
import UIKit
import pop

extension UIView {
    
    func bounce(withCompletion completion: ((POPAnimation?, Bool) -> Void)?) {
        
        let springAnimation = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
        springAnimation?.fromValue = NSValue(cgPoint: CGPoint(x: 0.5, y: 0.5))
        springAnimation?.toValue = NSValue(cgPoint: CGPoint(x: 1, y: 1))
        springAnimation?.velocity = NSValue(cgPoint: CGPoint(x: 8, y: 8))
        springAnimation?.springBounciness = 20
        springAnimation?.completionBlock = completion
        springAnimation?.springSpeed = 20
        
        self.pop_add(springAnimation, forKey: "springAnimation")
    }
    
    func setShadow() {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 2.5
        self.layer.shadowOpacity = 0.08
    }
}
