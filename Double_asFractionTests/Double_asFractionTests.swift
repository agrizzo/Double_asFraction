//
//  Double_asFractionTests.swift
//  Double_asFractionTests
//
//  Created by Tony Rizzo on 8/23/16.
//  Copyright © 2016 Koteray. All rights reserved.
//

import Foundation
import XCTest

@testable import Double_asFraction

class Double_asFractionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIT(){
        
        var x: Double
        var answer: String!
        let HalfArray: [Fraction] = (FractionConstants.WholeNumber + FractionConstants.Half).sorted(by: <)
        let ThirdsArray: [Fraction] = (FractionConstants.WholeNumber + FractionConstants.Third).sorted(by: <)
        let tenthsFractions: [Fraction] = [Fraction(description: "One Tenth", numerator: 1, denominator: 10, unicode: nil),
                                           Fraction(description: "Three Tenths", numerator: 3, denominator: 10, unicode: nil),
                                           Fraction(description: "Seven Tenths", numerator: 7, denominator: 10, unicode: nil),
                                           Fraction(description: "Nine Tenths", numerator: 9, denominator: 10, unicode: nil)]
        var TensArray: [Fraction] = (FractionConstants.WholeNumber + tenthsFractions + FractionConstants.Fifth + FractionConstants.Half)
        TensArray.sort(by: <)
        
        let logarArray: [Fraction] = [Fraction(description: "One Tenth", numerator: 1, denominator: 10, unicode: nil),
                                      FractionConstants.SixthOne, FractionConstants.FifthOne, FractionConstants.FourthOne, FractionConstants.ThirdOne, FractionConstants.HalfOne]
        
        
        
        //logarArray = (logarArray + FractionConstants.WholeNumber).sortInPlace(<)
        
        
        x = 0.0
        
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "0")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "0")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "0")
        
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "0")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "0")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "0")
        
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "0")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "0")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "0")
        
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "0 1/10")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "0 1/10")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "0 1/10")
        
        
        x = 444.44

        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "444")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "444")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "445")

        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "444 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "444")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "444 \(FractionConstants.HalfOne.unicode!)")
        
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "444 \(FractionConstants.ThirdOne.unicode!)")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "444 \(FractionConstants.ThirdOne.unicode!)")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "444 \(FractionConstants.ThirdTwo.unicode!)")

        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "444 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "444 \(FractionConstants.ThirdOne.unicode!)")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "444 \(FractionConstants.HalfOne.unicode!)")

        x = 7.5
        
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "8")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "7")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "8")
        
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "7 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "7 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "7 \(FractionConstants.HalfOne.unicode!)")
        
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "7 \(FractionConstants.ThirdTwo.unicode!)")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "7 \(FractionConstants.ThirdOne.unicode!)")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "7 \(FractionConstants.ThirdTwo.unicode!)")
        
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "7 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "7 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "7 \(FractionConstants.HalfOne.unicode!)")
        
        x = 21.77
        
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "22")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "21")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "22")
        
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "22")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "21 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "22")
        
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "21 \(FractionConstants.ThirdTwo.unicode!)")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "21 \(FractionConstants.ThirdTwo.unicode!)")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "22")
        
        answer = "\(x.asFraction(TensArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "21 \(FractionConstants.FifthFour.unicode!)")
        answer = "\(x.asFraction(TensArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "21 7/10")
        answer = "\(x.asFraction(TensArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "21 \(FractionConstants.FifthFour.unicode!)")
        
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "21 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "21 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "21 \(FractionConstants.HalfOne.unicode!)")
        
        x = 1.27
        
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "1")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "1")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "2")
        
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "1 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "1")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "1 \(FractionConstants.HalfOne.unicode!)")
        
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "1 \(FractionConstants.ThirdOne.unicode!)")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "1")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "1 \(FractionConstants.ThirdOne.unicode!)")
        
        answer = "\(x.asFraction(TensArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "1 3/10")
        answer = "\(x.asFraction(TensArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "1 \(FractionConstants.FifthOne.unicode!)")
        answer = "\(x.asFraction(TensArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "1 3/10")
        
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "1 \(FractionConstants.FourthOne.unicode!)")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "1 \(FractionConstants.FourthOne.unicode!)")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "1 \(FractionConstants.ThirdOne.unicode!)")
        
        x = -444.44
        
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-444")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-445")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-444")
        
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-444 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-444 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-444")
        
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-444 \(FractionConstants.ThirdOne.unicode!)")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-444 \(FractionConstants.ThirdTwo.unicode!)")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-444 \(FractionConstants.ThirdOne.unicode!)")
        
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-444 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-444 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-444 \(FractionConstants.ThirdOne.unicode!)")
        
        x = -7.5
        
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-8")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-8")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-7")
        
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-7 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-7 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-7 \(FractionConstants.HalfOne.unicode!)")
        
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-7 \(FractionConstants.ThirdTwo.unicode!)")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-7 \(FractionConstants.ThirdTwo.unicode!)")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-7 \(FractionConstants.ThirdOne.unicode!)")
        
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-7 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-7 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-7 \(FractionConstants.HalfOne.unicode!)")
        
        x = -21.77
        
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-22")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-22")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-21")
        
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-22")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-22")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-21 \(FractionConstants.HalfOne.unicode!)")
        
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-21 \(FractionConstants.ThirdTwo.unicode!)")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-22")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-21 \(FractionConstants.ThirdTwo.unicode!)")
        
        answer = "\(x.asFraction(TensArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-21 \(FractionConstants.FifthFour.unicode!)")
        answer = "\(x.asFraction(TensArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-21 \(FractionConstants.FifthFour.unicode!)")
        answer = "\(x.asFraction(TensArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-21 7/10")
        
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-21 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-21 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-21 \(FractionConstants.HalfOne.unicode!)")
        
        x = -1.27
        
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-1")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-2")
        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-1")
        
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-1 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-1 \(FractionConstants.HalfOne.unicode!)")
        answer = "\(x.asFraction(HalfArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-1")
        
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-1 \(FractionConstants.ThirdOne.unicode!)")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-1 \(FractionConstants.ThirdOne.unicode!)")
        answer = "\(x.asFraction(ThirdsArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-1")
        
        answer = "\(x.asFraction(TensArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-1 3/10")
        answer = "\(x.asFraction(TensArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-1 3/10")
        answer = "\(x.asFraction(TensArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-1 \(FractionConstants.FifthOne.unicode!)")
        
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.round))"
        XCTAssertEqual(answer, "-1 \(FractionConstants.FourthOne.unicode!)")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.down))"
        XCTAssertEqual(answer, "-1 \(FractionConstants.ThirdOne.unicode!)")
        answer = "\(x.asFraction(logarArray, roundLogic: Double.RoundLogic.up))"
        XCTAssertEqual(answer, "-1 \(FractionConstants.FourthOne.unicode!)")
        
    }
}
