//
//  engine.swift
//  Bmi Calculator Mac
//
//  Created by Артём Кармазь on 11/21/18.
//  Copyright © 2018 Артём Кармазь. All rights reserved.
//

import Foundation

public class Health {
    final let insufficient = "Insufficient"
    final let slighty = "Slightly reduced, not harmful to health"
    final let normal = "Normal"
    final let superfluos = "Superfluous"
    final let obesity1 = "Obesity of 1 degree"
    final let obesity2 = "Obesity of 2 degree"
    final let obesity3 = "Obesity of 3 degree"
    final let error = "Enter correct data"
}

public class HumanParameters {
    var age: Int?
    var weight: Double?
    var height: Double?
    var gender: String?
    
    init(age: Int?, weight: Double?, height: Double?, gender: String?) {
        self.age = age ?? 0
        self.weight = weight ?? 0
        self.height = height ?? 0
        self.gender = gender ?? ""
    }
    
    func checkCorrectInput(weight: Double?, height: Double?, age: Int?) -> Bool {
        if Double(weight ?? 0) > 160 || Double(weight ?? 0) < 20 {
            if Double(height ?? 0) > 240 || Double(height ?? 0) < 100 {
                if Int(age ?? 0) > 100 || Int(age ?? 0) < 18   {
                    return false
                }
            }
        }
        return true
    }
    
    func calculateBmi(weight: Double?, height: Double?) -> Double {
        let bmi = ((weight ?? 0) / ((height ?? 0) * (height ?? 0))) * 10000
        return bmi
    }
}
