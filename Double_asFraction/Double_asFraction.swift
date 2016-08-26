//
//  Double_AsFraction.swift
//  Double_AsFraction
//
//  Created by Tony Rizzo on 8/21/16.
//  Copyright © 2016 Koteray. All rights reserved.
//

import Foundation

extension Double {
    
    enum RoundTechnique {
        case Round
        case Up
        case Down
    }
    
    /// The positive number to the left of the decimal point
    var number: Double {
        get {
            return floor(fabs(self))
        }
    }
    
    /// The positive number to the right of the decimal point
    var decimal: Double {
        get {
            return fabs(self) - number
        }
    }

    /**
     
     Fractions must be a sorted array of fraction - sort by the value.
     
     
     */
    
    func asFraction(fractions: [Fraction],roundTechnique: RoundTechnique) -> String {
        
        let bestGuess = Int(floor(decimal * Double(fractions.count)))
        
        return findNearest(bestGuess, fractions: fractions, roundTechnique: roundTechnique)
        
    }
    
    private func findNearest(bestGuess: Int, fractions: [Fraction], roundTechnique: RoundTechnique) -> String {
        
        switch true {
            
        // Right where we need to be
        case self.decimal >= fractions[bestGuess].value && self.decimal < fractions[bestGuess + 1].value:
            switch true {
            case self.decimal == fractions[bestGuess].value:
                return showAnswer(fractions[bestGuess])
            case roundTechnique == RoundTechnique.Down:
                return showAnswer(fractions[bestGuess])
            case roundTechnique == RoundTechnique.Up:
                return showAnswer(fractions[bestGuess + 1])
            case roundTechnique == RoundTechnique.Round:
                if (self.decimal - fractions[bestGuess].value) < (fractions[bestGuess + 1].value - self.decimal) {
                    return showAnswer(fractions[bestGuess])
                } else {
                    return showAnswer(fractions[bestGuess+1])
                }
            default:
                return "Error in Code" //Since there will always be at least 1 roundtechnique that matches
            }
            
        // These are if we were close
        case self.decimal < fractions[bestGuess].value && bestGuess>0:
            return findNearest(bestGuess-1, fractions: fractions, roundTechnique: roundTechnique)
        case self.decimal > fractions[bestGuess].value && bestGuess+1<fractions.count-1:
            return findNearest(bestGuess+1, fractions: fractions, roundTechnique: roundTechnique)
            
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
        return "\(Int(floor(self)) + fraction.adder) \(fraction.displayAs)".stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
}