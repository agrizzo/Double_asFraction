# Double_asFraction

Purpose: Presents a double value as a fraction.

Implemented via

* Extension for Double
* Struct representing a Fraction

## How to Use

1. Need to build an ordered (ascending) array of acceptable fractions
2. Choose the type of rounding (up, down or standard)
3. Execute the method 

## Examples:

Show a 5664.343 as a ⅓ or ⅔ fraction by rounding to the nearest fraction.

1. Build an array of acceptable fractions (which would be [0, ⅓, ⅔, 1] - notice the elements are in ascending order.

Option 1:
Use the helper constants to build the array

let thirdsArray: [Fraction] = (FractionConstants.WholeNumber + FractionConstants.Third).sort(<)

Option 2: Build it by hand

let zero = Fraction(description: "Zero", numerator: 0, denominator: 1, unicode: "")
let oneThird = Fraction(description: "One Third", numerator: 1, denominator: 3, unicode: "\u{2153}")
let twoThirds = Fraction(description: "Two Thirds", numerator: 2, denominator: 3, unicode: "\u{2154}")
let one = Fraction(description: "One", numerator: 1, denominator: 1, unicode: "", adder: 1)
let thirdsArray = [zero, oneThird, twoThirds, one]

Execute:

let x: Double = 5664.343
let answer: String = x.asFraction(thirdsArray, roundTechnique: Float.RoundTechnique.round)

Answer should be 5664 ⅓ 


