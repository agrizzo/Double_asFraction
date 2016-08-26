//
//  Struct_Fraction.swift
//  Float_AsFraction
//
//  Created by Tony Rizzo on 8/22/16.
//  Copyright © 2016 Koteray. All rights reserved.
//

import Foundation

/**
 struct representing a fraction
 
 Properties
 - numerator (Int): Thge top number
 - denominator (Int): The bottom number
 - description (String): description
 - unicode (String): the unicode representation of the fraction. Used for display purposes only
 - adder (int): Should have the value of 1, when rounding up to the next number. Otherwise it is zero
 
 Computed Variables
 - value (Double): The quotient of the numerator and denominator. Used for all comparisons.
 - displayAs (String): Representation by putting a forward slash between the numerator and denominator
 
 Protocols:
 - CustomStringConvertible: has a description
 - Equatable (==): Based on the comparison of each fraction's value
 - Comparable (<): Based on the comparison of each fraction's value
 */
public struct Fraction: CustomStringConvertible {
    public let numerator: Int
    public let denominator: Int
    public let description: String
    public let unicode: String
    public let adder: Int
    
    public var value: Double {
        return Double(self.numerator) / Double(self.denominator)
    }
    
    public var displayAs: String {
        return "\(self.numerator)/\(self.denominator)"
    }
    
    public init(description: String, numerator: Int, denominator: Int, unicode: String, adder: Int = 0){
        self.numerator = numerator
        self.denominator = denominator
        self.description = description
        self.unicode = unicode
        self.adder = adder
    }
    
}

// MARK: Equatable
extension Fraction: Equatable{}

    public func ==(lhs: Fraction, rhs: Fraction) -> Bool {
        return lhs.value == rhs.value
    }

// MARK: Comparable
extension Fraction: Comparable{}

    public func <(lhs: Fraction, rhs: Fraction) -> Bool {
        return lhs.value < rhs.value
    }


// MARK: Fraction Constants - helpers
/// Helper Struct with various constants for ease of reference
public struct FractionConstants {
    public static let Zero = Fraction(description: "Zero", numerator: 0, denominator: 1, unicode: "")
    public static let One = Fraction(description: "One", numerator: 1, denominator: 1, unicode: "", adder: 1)
    public static let HalfOne = Fraction(description: "One Half", numerator: 1, denominator: 2, unicode: "\u{00BD}")
    public static let ThirdOne = Fraction(description: "One Third", numerator: 1, denominator: 3, unicode: "\u{2153}")
    public static let ThirdTwo = Fraction(description: "Two Thirds", numerator: 2, denominator: 3, unicode: "\u{2154}")
    public static let FourthOne = Fraction(description: "One Fourth", numerator: 1, denominator: 4, unicode: "\u{00BC}")
    public static let FourthThree = Fraction(description: "Three Fourths", numerator: 3, denominator: 4, unicode: "\u{00BE}")
    public static let FifthOne = Fraction(description: "One Fifth", numerator: 1, denominator: 5, unicode: "\u{2155}")
    public static let FifthTwo = Fraction(description: "Two Fifths", numerator: 2, denominator: 5, unicode: "\u{2156}")
    public static let FifthThree = Fraction(description: "Three Fifths", numerator: 3, denominator: 5, unicode: "\u{2157}")
    public static let FifthFour = Fraction(description: "Four Fifths", numerator: 4, denominator: 5, unicode: "\u{2158}")
    public static let SixthOne = Fraction(description: "One Sixth", numerator: 1, denominator: 6, unicode: "\u{2159}")
    public static let SixthFive = Fraction(description: "Five Sixths", numerator: 5, denominator: 6, unicode: "\u{215A}")
    public static let EighthOne = Fraction(description: "One Eighth", numerator: 1, denominator: 8, unicode: "\u{215B}")
    public static let EighthThree = Fraction(description: "Three Eighths", numerator: 3, denominator: 8, unicode: "\u{215C}")
    public static let EighthFive = Fraction(description: "Five Eighths", numerator: 5, denominator: 8, unicode: "\u{215D}")
    public static let EighthSeven = Fraction(description: "Seven Eighths", numerator: 7, denominator: 8, unicode: "\u{215E}")
    
    public static let WholeNumber = [FractionConstants.Zero, FractionConstants.One]
    public static let Half = [FractionConstants.HalfOne]
    public static let Third = [FractionConstants.ThirdOne, FractionConstants.ThirdTwo]
    public static let Quarter = [FractionConstants.FourthOne, FractionConstants.FourthThree]
    public static let Fifth = [FractionConstants.FifthOne, FractionConstants.FifthTwo, FractionConstants.FifthThree, FractionConstants.FifthFour]
    public static let Sixth = [FractionConstants.SixthOne, FractionConstants.SixthFive]
    public static let Eighth = [FractionConstants.EighthOne, FractionConstants.EighthThree, FractionConstants.EighthFive, FractionConstants.EighthSeven]
    
    
}