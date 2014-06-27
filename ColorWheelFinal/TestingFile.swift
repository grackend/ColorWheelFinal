//
//  TestingFile.swift
//  ColorWheel
//
//  Created by Grace Kendall on 6/24/14.
//  Copyright (c) 2014 Grace Kendall. All rights reserved.
//

import Foundation
import UIKit


class TestingFile: UIButton {
    
    override func setNeedsLayout() {
        //circular buttons
        self.layer.cornerRadius = self.bounds.size.width / 2.0
    }
    
}