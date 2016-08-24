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
        
        x = 444.44
        var answer: String!

        answer = "\(x.asFraction(FractionConstants.WholeNumber, roundTechnique: Double.RoundTechnique.Up))"
        XCTAssertEqual(answer, "445")
        
        var HalfArray: [Fraction] = FractionConstants.WholeNumber + FractionConstants.Half
        HalfArray.sortInPlace({$0.value < $1.value})
        answer = "\(x.asFraction(HalfArray, roundTechnique: Double.RoundTechnique.Up))"
        XCTAssertEqual(answer, "444 \(FractionConstants.HalfOne.unicode)")
        
        let ThirdsArray: [Fraction] = (FractionConstants.WholeNumber + FractionConstants.Third).sort(<)
        answer = "\(x.asFraction(ThirdsArray, roundTechnique: Double.RoundTechnique.Up))"
        XCTAssertEqual(answer, "444 \(FractionConstants.ThirdTwo.unicode)")
        answer = "\(x.asFraction(ThirdsArray, roundTechnique: Double.RoundTechnique.Down))"
        XCTAssertEqual(answer, "444 \(FractionConstants.ThirdOne.unicode)")
        answer = "\(x.asFraction(ThirdsArray, roundTechnique: Double.RoundTechnique.Round))"
        XCTAssertEqual(answer, "444 \(FractionConstants.ThirdOne.unicode)")
    }
    
    
}
