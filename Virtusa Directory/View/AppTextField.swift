//
//  AppTextField.swift
//  Virtusa Directory
//
//  Created by Preeteesh Remalli on 20/10/22.
//

import UIKit

class AppTextField: UITextField {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        textColor = Theme.Color.textOnDark
        
        if let placeholderText = placeholder {
            attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        }
        
        layer.borderColor = Theme.Color.accent.cgColor
        layer.borderWidth = 1
        
        layer.cornerRadius = 8
        
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 3)
    }
}
