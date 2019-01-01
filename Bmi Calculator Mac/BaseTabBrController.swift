//
//  helper.swift
//  Bmi Calculator Mac
//
//  Created by Артём Кармазь on 11/20/18.
//  Copyright © 2018 Артём Кармазь. All rights reserved.
//

import Foundation

public class BaseTabBarController: UITabBarController {
    
    @IBInspectable var defaultIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = defaultIndex
    }
}


