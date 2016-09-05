//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Yemi Ajibola on 9/4/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    @IBOutlet var celsiusLabel: UILabel!
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        if let text = textField.text  where !text.isEmpty {
            celsiusLabel.text = text
        } else {
            celsiusLabel.text = "???"
        }
    }
    
}
