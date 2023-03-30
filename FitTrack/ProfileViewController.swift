//
//  ProfileViewController.swift
//  FitTrack
//
//  Created by Matthew Dlugosz on 3/16/23.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameEntry: UITextField!
    @IBOutlet weak var ageEntry: UILabel!
    @IBOutlet weak var stepperForAge: UIStepper!
    @IBOutlet weak var birthdayEntryOne: UITextField!
    @IBOutlet weak var birthdayEntryTwo: UITextField!
    @IBOutlet weak var birthdayEntryThree: UITextField!
    @IBOutlet weak var heightEntryFeet: UITextField!
    @IBOutlet weak var heightEntryInches: UITextField!
    @IBOutlet weak var weightEntry: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var sexSelect: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameEntry.delegate = self
        birthdayEntryOne.delegate = self
        birthdayEntryTwo.delegate = self
        birthdayEntryThree.delegate = self
        stepperForAge.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        restoreSavedData()
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedDigits = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        if textField == nameEntry {
            let allowedCharacters = CharacterSet.letters
            return allowedCharacters.isSuperset(of: characterSet)
        } else if textField == birthdayEntryOne || textField == birthdayEntryTwo {
            if allowedDigits.isSuperset(of: characterSet) {
                let currentText = textField.text ?? ""
                let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
                if newText.count <= 2 {
                    if textField == birthdayEntryOne {
                        return Int(newText) ?? 0 <= 12
                    } else {
                        return Int(newText) ?? 0 <= 31
                    }
                }
            }
            return false
        } else if textField == birthdayEntryThree {
            if allowedDigits.isSuperset(of: characterSet) {
                let currentText = textField.text ?? ""
                let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
                return newText.count <= 4
            }
            return false
        } else if textField == heightEntryFeet {
            if allowedDigits.isSuperset(of: characterSet) {
                let currentText = textField.text ?? ""
                let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
                return newText.count <= 1
            }
            return false
        } else if textField == heightEntryInches {
            if allowedDigits.isSuperset(of: characterSet) {
                let currentText = textField.text ?? ""
                let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
                if newText.count <= 2 {
                    return Int(newText) ?? 0 <= 11
                }
            }
            return false
        }
        
        return true
    }
    
    @objc func stepperValueChanged(sender: UIStepper) {
        let age = Int(sender.value)
        ageEntry.text = "\(age)"
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        saveProfileData()
        print(weights)
        
    }
    
    func saveProfileData() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(nameEntry.text, forKey: "name")
        userDefaults.set(ageEntry.text, forKey: "age")
        userDefaults.set(stepperForAge.value, forKey: "stepperValue")
        userDefaults.set(sexSelect.selectedSegmentIndex, forKey: "sex")
        userDefaults.set(birthdayEntryOne.text, forKey: "birthdayEntryOne")
        userDefaults.set(birthdayEntryTwo.text, forKey: "birthdayEntryTwo")
        userDefaults.set(birthdayEntryThree.text, forKey: "birthdayEntryThree")
        userDefaults.set(heightEntryFeet.text, forKey: "heightFeet")
        userDefaults.set(heightEntryInches.text, forKey: "heightInches")
        userDefaults.set(weightEntry.text, forKey: "weight")
        
        weights.append((Double(weightEntry.text!)!))

        
        userDefaults.synchronize()
    }
    
    func restoreSavedData() {
        let userDefaults = UserDefaults.standard
        
        if let name = userDefaults.string(forKey: "name") {
            nameEntry.text = name
        }
        
        if let age = userDefaults.string(forKey: "age") {
            ageEntry.text = age
        }
        
        if let stepperValue = userDefaults.value(forKey: "stepperValue") as? Double {
            stepperForAge.value = stepperValue
        }
        
        sexSelect.selectedSegmentIndex = userDefaults.integer(forKey: "sex")
        
        if let birthdayOne = userDefaults.string(forKey: "birthdayEntryOne") {
            birthdayEntryOne.text = birthdayOne
        }
            
        if let birthdayTwo = userDefaults.string(forKey: "birthdayEntryTwo") {
            birthdayEntryTwo.text = birthdayTwo
        }
        
        if let birthdayThree = userDefaults.string(forKey: "birthdayEntryThree") {
            birthdayEntryThree.text = birthdayThree
        }

        if let heightFeet = userDefaults.string(forKey: "heightFeet") {
            heightEntryFeet.text = heightFeet
        }
                        
        if let heightInches = userDefaults.string(forKey: "heightInches") {
            heightEntryInches.text = heightInches
        }
                        
        if let weight = userDefaults.string(forKey: "weight") {
            weightEntry.text = String(weights[weights.count - 1 ])
        }
    }

}
