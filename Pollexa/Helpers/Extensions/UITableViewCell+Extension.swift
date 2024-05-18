//
//  UITableViewCell+Extension.swift
//  Pollexa
//
//  Created by Furkan Yıldırım on 18.05.2024.
//

import Foundation
import UIKit

extension UITableViewCell{
    @IBInspectable var cornerRadius:CGFloat{
        get{
            return self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}

extension UIImageView{
    @IBInspectable var cornerRadius:CGFloat{
        get{
            return self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
