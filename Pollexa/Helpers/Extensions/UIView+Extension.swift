//
//  UITableViewCell+Extension.swift
//  Pollexa
//
//  Created by Furkan Yıldırım on 18.05.2024.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get{ return self.cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
