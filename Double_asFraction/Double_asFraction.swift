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
        case round
        case up
        case down
    }
    
    /// The number to the right of the decimal point. (Always positive)
    var decimal: Double {
        get {
            return fabs(self) - floor(fabs(self))
        }
    }

    /**
     Helper function that rounds the Double to the Integer closest to zero
     
     For example:
     *  2.7 ->  2
     *  1.0 ->  1
     * -2.9 -> -2
    */
    func roundTowardZero() -> Int {
        if !(self.sign == .minus) {
            return Int(floor(self))
        } else {
            return Int(ceil(self))
        }
    }
    
    /**
     Returns the string representation of the fraction closest to self from the array of fractions
     
     - returns: String
     - Parameters:
       - fractions: Array of Fractions. Must be sorted in ascending order.
       - roundLogic: Rounding technique
     */
    
    func asFraction(_ fractions: [Fraction], roundLogic: RoundLogic) -> String {
        let bestGuess = Int(floor(decimal * Double(fractions.count)))
        return findNearest(bestGuess, fractions: fractions, roundLogic: roundLogic)
    }
    
    /**
     Find the nearest entry in the array
     
     - returns: String
     - parameter bestGuess: Index value most likely to have answer
     - parameter fractions: Array of Fractions. Must be sorted in ascending order
     - parameter roundLogic: Rounding technique
    */
    fileprivate func findNearest(_ bestGuess: Int, fractions: [Fraction], roundLogic: RoundLogic) -> String {
        
        switch true {
            
        // most likely scenerio
        case self.decimal > fractions[bestGuess].value && self.decimal < fractions[bestGuess + 1].value:
            
            if !(self.sign == .minus) {
                switch roundLogic {
                case .down:
                    return showAnswer(fractions[bestGuess])
                case .up:
                    return showAnswer(fractions[bestGuess + 1])
                case .round:
                    if (self.decimal - fractions[bestGuess].value) < (fractions[bestGuess + 1].value - self.decimal) {
                        return showAnswer(fractions[bestGuess])
                    } else {
                        return showAnswer(fractions[bestGuess+1])
                    }
                }
            } else {
                switch roundLogic {
                case .down:
                    return showAnswer(fractions[bestGuess + 1])
                case .up:
                    return showAnswer(fractions[bestGuess])
                case .round:
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
            fatalError("Default case  Not sure how we got here")
        }
        
    }
    
    
    fileprivate func showAnswer(_ fraction: Fraction) -> String {
        let offset: Int = !(self.sign == .minus) ? fraction.adder : fraction.adder * -1
        return "\(self.roundTowardZero() + offset) \(fraction.displayAs)".trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
}
