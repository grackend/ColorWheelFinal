//
//  ColorController.swift
//  ColorWheel
//
//  Created by Grace Kendall on 6/23/14.
//  Copyright (c) 2014 Grace Kendall. All rights reserved.
//

import Foundation
import UIKit


//  Begin Random Number Generator code  //
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    func random() -> Double{
        let randomNum = arc4random()
        return Double(randomNum) % 18
    }
}

let generator = LinearCongruentialGenerator()
//  End Random Number Generator code  //


//isSimilarTo handles prevention of two very similar colors showing up on the palette
func isSimilarTo(color1: UIColor, color2: UIColor) -> Bool {
    
    var redClose = false
    var greenClose = false
    var blueClose = false
    
    var color1Arr = CGFloat[](count: 4, repeatedValue: 0.0)
    color1.getRed(&color1Arr[0], green: &color1Arr[1], blue: &color1Arr[2], alpha: &color1Arr[3])
    var color2Arr = CGFloat[](count: 4, repeatedValue: 0.0)
    color2.getRed(&color2Arr[0], green: &color2Arr[1], blue: &color2Arr[2], alpha: &color2Arr[3])
    
    if abs(color1Arr[0] - color2Arr[0]) < 0.25 {
        redClose = true
    }
    
    if abs(color1Arr[1] - color2Arr[1]) < 0.25 {
        greenClose = true
    }
    
    if abs(color1Arr[2] - color2Arr[2]) < 0.25 {
        blueClose = true
    }
    
    if(redClose == true && greenClose == true && blueClose == true){
        return true
    }else{
        return false;
    }
    
}


class ColorController : UIView {
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        
        colorArray[0] = origColor
        
        //rgba is the original color's red, green, blue and alpha attributes
        var rgba = CGFloat[](count: 4, repeatedValue: 0.0)
        origColor.getRed(&rgba[0], green: &rgba[1], blue: &rgba[2], alpha: &rgba[3])
        
        
        //redArray holds all of the numbers that could be combined to create
        //matching colors
        var redArray = CGFloat[](count: 18, repeatedValue: 0.0)
        
        redArray[0] = rgba[0]
        redArray[1] = rgba[1]
        redArray[2] = rgba[2]
        
        if rgba[0] < (194/255) {
            redArray[3] = rgba[0] + (61/255)
        }else{
            redArray[3] = rgba[0] - (61/255)
        }
        
        if rgba[0] < (224/255) {
            redArray[4] = rgba[0] + (31/255)
        }else{
            redArray[4] = rgba[0] - (31/255)
        }
        
        if rgba[0] < (0.5){
            redArray[5] = rgba[0] * 2
        }else{
            redArray[5] = rgba[0] / 2
        }
        
        redArray[6] = rgba[0]
        redArray[7] = rgba[1]
        redArray[8] = rgba[2]
        
        if rgba[1] < (194/255) {
            redArray[9] = rgba[1] + (61/255)
        }else{
            redArray[9] = rgba[1] - (61/255)
        }
        
        if rgba[1] < (224/255) {
            redArray[10] = rgba[1] + (31/255)
        }else{
            redArray[10] = rgba[1] - (31/255)
        }
        
        if rgba[1] < (0.5){
            redArray[11] = rgba[1] * 2
        }else{
            redArray[11] = rgba[1] / 2
        }
        
        redArray[12] = rgba[0]
        redArray[13] = rgba[1]
        redArray[14] = rgba[2]
        
        if rgba[2] < (194/255) {
            redArray[15] = rgba[2] + (61/255)
        }else{
            redArray[15] = rgba[2] - (61/255)
        }
        
        if rgba[2] < (224/255) {
            redArray[16] = rgba[2] + (31/255)
        }else{
            redArray[16] = rgba[2] - (31/255)
        }
        
        if rgba[2] < (0.5){
            redArray[17] = rgba[2] * 2
        }else{
            redArray[17] = rgba[2] / 2
        }
        
        
        func getColor() -> (){
            var redIndex = Int(generator.random())
            var blueIndex = Int(generator.random())
            var greenIndex = Int(generator.random())
            
            var Black: UIColor = UIColor .blackColor()
            
            
            // Begin Match calculations
            var MatchOne: UIColor = UIColor(red: redArray[redIndex], green: redArray[greenIndex], blue: redArray[blueIndex], alpha: rgba[3])
            
            while MatchOne == origColor || (redArray[redIndex] < 0.2 && redArray[blueIndex] < 0.2 && redArray[greenIndex] < 0.2) || (redArray[redIndex] > 0.9 && redArray[blueIndex] > 0.9 && redArray[greenIndex] > 0.9  || isSimilarTo(origColor, MatchOne) || isSimilarTo(colorArray[2], MatchOne) || isSimilarTo(colorArray[3], MatchOne)) {
                redIndex = Int(generator.random())
                blueIndex = Int(generator.random())
                greenIndex = Int(generator.random())
                
                MatchOne = UIColor(red: redArray[redIndex], green: redArray[greenIndex], blue: redArray[blueIndex], alpha: rgba[3])
            }
            
            redIndex = Int(generator.random())
            blueIndex = Int(generator.random())
            greenIndex = Int(generator.random())
            
            var MatchTwo: UIColor = UIColor(red: redArray[redIndex], green: redArray[greenIndex], blue: redArray[blueIndex], alpha: rgba[3])
            
            while MatchTwo == origColor || MatchTwo == colorArray[1] || (redArray[redIndex] < 0.2 && redArray[blueIndex] < 0.2 && redArray[greenIndex] < 0.2) || (redArray[redIndex] > 0.9 && redArray[blueIndex] > 0.9 && redArray[greenIndex] > 0.9 || isSimilarTo(origColor, MatchTwo) || isSimilarTo(colorArray[1], MatchTwo) || isSimilarTo(colorArray[3], MatchTwo)){
                redIndex = Int(generator.random())
                blueIndex = Int(generator.random())
                greenIndex = Int(generator.random())
                
                MatchTwo = UIColor(red: redArray[redIndex], green: redArray[greenIndex], blue: redArray[blueIndex], alpha: rgba[3])
            }
            
            redIndex = Int(generator.random())
            blueIndex = Int(generator.random())
            greenIndex = Int(generator.random())
            
            var MatchThree: UIColor = UIColor(red: redArray[redIndex], green: redArray[greenIndex], blue: redArray[blueIndex], alpha: rgba[3])
            
            while MatchThree == origColor || MatchThree == colorArray[1] || MatchThree == colorArray[2] || (redArray[redIndex] < 0.2 && redArray[blueIndex] < 0.2 && redArray[greenIndex] < 0.2) || (redArray[redIndex] > 0.9 && redArray[blueIndex] > 0.9 && redArray[greenIndex] > 0.9 || isSimilarTo(origColor, MatchThree) || isSimilarTo(colorArray[1], MatchThree) || isSimilarTo(colorArray[2], MatchThree)){
                
                redIndex = Int(generator.random())
                blueIndex = Int(generator.random())
                greenIndex = Int(generator.random())
                
                MatchThree = UIColor(red: redArray[redIndex], green: redArray[greenIndex], blue: redArray[blueIndex], alpha: rgba[3])
            }
            // End Match calculations
            
            
            if self.accessibilityLabel == "ColorOriginal" {
                self.backgroundColor = colorArray[0]
            }else if self.accessibilityLabel == "MatchOne" {
                colorArray[1] = MatchOne
                self.backgroundColor = colorArray[1]
            }else if self.accessibilityLabel == "MatchTwo" {
                colorArray[2] = MatchTwo
                self.backgroundColor = colorArray[2]
            }else if self.accessibilityLabel == "MatchThree" {
                colorArray[3] = MatchThree
                self.backgroundColor = colorArray[3]
            }
            
        }
        getColor()
        self.layer.cornerRadius = self.bounds.size.width / 2.0 // circular buttons
    }
}