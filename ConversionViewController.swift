//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Yemi Ajibola on 9/4/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var farenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Double? {
        if let value = farenheitValue {
            return (value - 32) * (5/9)
        } else {
            return nil
        }
    }
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        if let text = textField.text, value = Double(text) {
            farenheitValue = value
        } else {
            farenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        
        let existingTextHasAlphabetCharacters = textField.text?.rangeOfCharacterFromSet(NSCharacterSet.letterCharacterSet())
        let replacementTextHasAlphabetCharacters = string.rangeOfCharacterFromSet(NSCharacterSet.letterCharacterSet())
        
        if (existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil) || (existingTextHasAlphabetCharacters != nil && replacementTextHasAlphabetCharacters != nil) {
            return false
        } else {
            return true
        }
    }
}
