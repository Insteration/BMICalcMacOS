//
//  ViewController.swift
//  Bmi Calculator Mac
//
//  Created by Артём Кармазь on 11/20/18.
//  Copyright © 2018 Артём Кармазь. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var ageInput: NSTextField!
    @IBOutlet weak var weightInput: NSTextField!
    @IBOutlet weak var genderButton: NSPopUpButton!
    @IBOutlet weak var resultLabel: NSTextField!
    @IBOutlet weak var heightInput: NSTextField!
    @IBOutlet weak var healthDiagnosis: NSTextField!
    @IBAction func exitButton(_ sender: Any) {
        _ = exit(0)
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        let humanParamets = HumanParameters(age: Int(ageInput.intValue), weight: Double(weightInput.doubleValue), height: Double(heightInput.doubleValue), gender: String(genderButton.stringValue))
        let health = Health()
        let checkInput = humanParamets.checkCorrectInput(weight: Double(weightInput.doubleValue), height: Double(heightInput.doubleValue), age: Int(ageInput.intValue))
        
        func bmiFinal() {
            let calculate = humanParamets.calculateBmi(weight: heightInput.doubleValue, height: weightInput.doubleValue)
            switch calculate {
            case ..<17.5:
                healthDiagnosis.stringValue = health.insufficient
            case 17.5..<19.5:
                healthDiagnosis.stringValue = health.slighty
            case 19.5..<22.9:
                healthDiagnosis.stringValue = health.normal
            case 23.0..<27.4:
                healthDiagnosis.stringValue = health.superfluos
            case 27.5..<29.9:
                healthDiagnosis.stringValue = health.obesity1
            case 30.0..<34.9:
                healthDiagnosis.stringValue = health.obesity2
            case 35.0..<39.9:
                healthDiagnosis.stringValue = health.obesity3
            default:
                ()
            }
            resultLabel.stringValue = String(format: "%.2f", calculate)
        }
        while checkInput != true {
            resultLabel.stringValue = ""
            healthDiagnosis.stringValue = health.error
            break
        }
        if checkInput == true {
            healthDiagnosis.stringValue = ""
            bmiFinal()
            
        }     
    }
}

