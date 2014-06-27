//
//  ButtonController.swift
//  ColorWheel
//
//  Created by Grace Kendall on 6/24/14.
//  Copyright (c) 2014 Grace Kendall. All rights reserved.
//

import Foundation
import UIKit

var noneSelected: Bool = false


//The colorArray holds the four colors that will show up on the palette
var colorArray: UIColor[] = [UIColor .whiteColor(), UIColor .whiteColor(), UIColor .whiteColor(), UIColor .whiteColor()]

//origColor is the color the user chose
var origColor: UIColor = UIColor()

class ButtonController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        switch segue.identifier! {
        case "RedSegue":
            origColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        case "RedOrangeSegue":
            origColor = UIColor(red: 0.95678, green: 0.43704, blue: 0.25741, alpha: 1.0)
        case "FuschiaSegue":
            origColor = UIColor(red: 0.95678, green: 0.24217, blue: 0.45291, alpha: 1.0)
        case "MagentaSegue":
            origColor = UIColor(red: 0.95678, green: 0.26952, blue: 0.84864, alpha: 1.0)
        case "RoseSegue":
            origColor = UIColor(red: 1.0, green: 0.65736, blue: 0.78310, alpha: 1.0)
        case "BabyPinkSegue":
            origColor = UIColor(red: 1.0, green: 0.78985, blue: 1.0, alpha: 1.0)
        case "OrangeSegue":
            origColor = UIColor(red: 1.0, green: 0.72709, blue: 0.0, alpha: 1.0)
        case "GoldenrodSegue":
            origColor = UIColor(red: 1.0, green: 0.91148, blue: 0.0, alpha: 1.0)
        case "YellowSegue":
            origColor = UIColor(red: 1.0, green: 1.0, blue: 0, alpha: 1.0)
        case "YellowGreenSegue":
            origColor = UIColor(red: 0.78382, green: 0.95678, blue: 0.30451, alpha: 1.0)
        case "GreenSegue":
            origColor = UIColor(red: 0.25636, green: 0.95678, blue: 0.51797, alpha: 1.0)
        case "MossSegue":
            origColor = UIColor(red: 0.0, green: 0.50196, blue: 0.25098, alpha: 1.0)
        case "SeaFoamSegue":
            origColor = UIColor(red: 0.41767, green: 0.95678, blue: 0.89126, alpha: 1.0)
        case "IceSegue":
            origColor = UIColor(red: 0.55472, green: 1.0, blue: 0.98932, alpha: 1.0)
        case "RobinsEggSegue":
            origColor = UIColor(red: 0.24836, green: 0.86673, blue: 1.0, alpha: 1.0)
        case "SkySegue":
            origColor = UIColor(red: 0.0, green: 0.69542, blue: 0.95678, alpha: 1.0)
        case "PeriwinkleSegue":
            origColor = UIColor(red: 0.21388, green: 0.49418, blue: 0.95678, alpha: 1.0)
        case "PurpleSegue":
            origColor = UIColor(red: 0.62752, green: 0.19313, blue: 0.95678, alpha: 1.0)
        case "IndigoSegue":
            origColor = UIColor(red: 0.42653, green: 0.0, blue: 0.95678, alpha: 1.0)
        case "LavenderSegue":
            origColor = UIColor(red: 0.73790, green: 0.49323, blue: 0.95678, alpha: 1.0)
            
            
        default:
            noneSelected = true
        }
    }
}