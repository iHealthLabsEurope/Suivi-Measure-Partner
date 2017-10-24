//
//  Colors.swift
//  Partner App
//
//  Created by Gustavo Serra on 19/10/2017.
//  Copyright © 2017 iHealthLabs. All rights reserved.
//

import Foundation
import UIKit

enum Colors {
    
    case primaryColor, primaryColorLowContrast, secondaryColor, backgroundColor, textWithBackgroudColor, textTitleColor, textColor, dangerColor
    
    var color: UIColor {
        switch self {
        case .primaryColor:
            return UIColor(red: 255.0 / 255.0, green: 79.0 / 255.0, blue: 173.0 / 255.0, alpha: 1.0)
            
        case .primaryColorLowContrast:
            return UIColor(red: 255.0 / 255.0, green: 207.0 / 255.0, blue: 232.0 / 255.0, alpha: 1.0)
            
        case .secondaryColor:
            return UIColor(red: 89.0 / 255.0, green: 90.0 / 255.0, blue: 88.0 / 255.0, alpha: 1.0)
            
        case .backgroundColor:
            return UIColor(red: 245.0 / 255.0, green: 245.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
            
        case .textWithBackgroudColor:
            return UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
            
        case .textTitleColor:
            return UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
            
        case .textColor:
            return UIColor(red: 184.0 / 255.0, green: 184.0 / 255.0, blue: 184.0 / 255.0, alpha: 1.0)
            
        case .dangerColor:
            return UIColor(red: 253.0 / 255.0, green: 75.0 / 255.0, blue: 62.0 / 255.0, alpha: 1.0)
        }
    }
}
