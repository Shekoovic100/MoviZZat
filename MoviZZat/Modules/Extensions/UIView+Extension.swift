//
//  UIView+Extension.swift
//  MoviZZat
//
//  Created by sherif on 28/12/2022.
//

import Foundation
import UIKit



extension UIView {
    
    @IBInspectable var cornerRadious:CGFloat {
        get{
            return self.cornerRadious
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
