//
//  Double_AsFraction.swift
//  Double_AsFraction
//
//  Created by Tony Rizzo on 8/21/16.
//  Copyright © 2016 Koteray. All rights reserved.
//

import Foundation

extension Double {
    
    /**
     Logic to round values
     
      * Round: Follows Apple's logic: When equidistant, round away from zero
      * Up: Towards positive infinity
      * Down: Towards negative infinity
    */
    enum RoundLogic {
        case Round
        case Up
        case Down
    }
    
    /// The positive number to the right of the decimal point
    var decimal: Double {
        get {
            return fabs(self) - floor(fabs(self))
        }
    }

    /**
     Helper function that converts the double to the integer closest to zero
    */
    func roundTowardZero() -> Int {
        if !self.isSignMinus {
            return Int(floor(self))
        } else {
            return Int(ceil(self))
        }
    }
    
    /**
     
     Fractions must be a sorted array of fraction - sort by the value.
     
     
     */
    
    func asFraction(fractions: [Fraction], roundLogic: RoundLogic) -> String {
        let bestGuess = Int(floor(decimal * Double(fractions.count)))
        return findNearest(bestGuess, fractions: fractions, roundLogic: roundLogic)
    }
    
    private func findNearest(bestGuess: Int, fractions: [Fraction], roundLogic: RoundLogic) -> String {
        
        switch true {
            
        // most likely scenerio
        case self.decimal > fractions[bestGuess].value && self.decimal < fractions[bestGuess + 1].value:
            
            if !self.isSignMinus {
                switch roundLogic {
                case .Down:
                    return showAnswer(fractions[bestGuess])
                case .Up:
                    return showAnswer(fractions[bestGuess + 1])
                case .Round:
                    if (self.decimal - fractions[bestGuess].value) < (fractions[bestGuess + 1].value - self.decimal) {
                        return showAnswer(fractions[bestGuess])
                    } else {
                        return showAnswer(fractions[bestGuess+1])
                    }
                }
            } else {
                switch roundLogic {
                case .Down:
                    return showAnswer(fractions[bestGuess + 1])
                case .Up:
                    return showAnswer(fractions[bestGuess])
                case .Round:
                    if (self.decimal - fractions[bestGuess].value) < (fractions[bestGuess + 1].value - self.decimal) {
                        return showAnswer(fractions[bestGuess])
                    } else {
                        return showAnswer(fractions[bestGuess+1])
                    }
                }

            }
            
            
        // Exact match
        case self.decimal == fractions[bestGuess].value:
            return showAnswer(fractions[bestGuess])
            
        // Outside the range
        case self.decimal <= fractions[0].value:
            return showAnswer(fractions[0])
        case self.decimal >= fractions[fractions.count - 1].value:
            return showAnswer(fractions[fractions.count - 1])
            
        // These need to be re-adjusted
        case self.decimal < fractions[bestGuess].value && bestGuess>0:
            return findNearest(bestGuess-1, fractions: fractions, roundLogic: roundLogic)
        case self.decimal > fractions[bestGuess].value && bestGuess+1<fractions.count-1:
            return findNearest(bestGuess+1, fractions: fractions, roundLogic: roundLogic)
            
        // These get processed when the array doesn't lead with a zero value or end with a one value
        case self.decimal < fractions[bestGuess].value: // Redundant to add: && !(bestGuess>0):
            return showAnswer(fractions[bestGuess])
        case self.decimal > fractions[bestGuess].value: // Redundant to add: && !(bestGuess+1<fractions.count-1):
            return showAnswer(fractions[bestGuess + 1])
        default:
            return "Default case-  Not sure how we got here"
        }
        
    }
    
    
    private func showAnswer(fraction: Fraction) -> String {
        //return "\(Int(floor(self)) + fraction.adder) \(fraction.displayAs)".stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let offset: Int = !self.isSignMinus ? fraction.adder : fraction.adder * -1
        return "\(self.roundTowardZero() + offset) \(fraction.displayAs)".stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
}