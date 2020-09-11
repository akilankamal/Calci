//
//  CalciTests.swift
//  CalciTests
//
//  Created by Akilan on 10/09/20.
//  Copyright © 2020 aki. All rights reserved.
//

import XCTest
@testable import Calci

class CalciTests: XCTestCase {
    
    private let INVALID_OPERATION = "Invalid Operation"
    private let INFINITY = "∞"
    
    private var calculator: Calculatable? = CalciLibrary()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        calculator = nil
    }

    func testAddWithValidOperandsShouldPass() throws {
        let expected = "80"
        let actual = calculator?.add(operand1: "40", operand2: "40")
        XCTAssertTrue(expected == actual)
    }

    func testAddWithValidDecimalOperandsShouldPass() throws {
        let expected = "122.72"
        let actual = calculator?.add(operand1: "90.16", operand2: "32.56")
        XCTAssertTrue(expected == actual)
    }
    
    func testAddWithIncompleteDecimalOperandsShouldPass() throws {
        let expected = "42"
        let actual = calculator?.add(operand1: "38.", operand2: "4")
        XCTAssertTrue(expected == actual)
    }
    
    func testAddWithInvalidOperandsShouldLeaveMessage() throws {
        let expected = INVALID_OPERATION
        let actual = calculator?.add(operand1: "32", operand2: "Not a number")
        XCTAssertTrue(expected == actual)
    }
    
    func testAddWithLargeDecimalOperandsShouldPass() throws {
        let expected = "6.33946"
        let actual = calculator?.add(operand1: "3.216", operand2: "3.12346")
        XCTAssertTrue(expected == actual)
    }
    
    func testSubtractWithValidOperandsShouldPass() throws {
        let expected = "25"
        let actual = calculator?.subtract(operand1: "75", operand2: "50")
        XCTAssertTrue(expected == actual)
    }
    
    func testSubtractWithValidDecimalOperandsShouldPass() throws {
        let expected = "3.3204"
        let actual = calculator?.subtract(operand1: "6.465", operand2: "3.1446")
        XCTAssertTrue(expected == actual)
    }
    
    func testSubtractWithInvalidOperandsShouldLeaveMessage() throws {
        let expected = INVALID_OPERATION
        let actual = calculator?.subtract(operand1: "20", operand2: "Not a number")
        XCTAssertTrue(expected == actual)
    }
    
    func testSubtractWithLargeDecimalOperandsShouldPass() throws {
        let expected = "1.96785"
        let actual = calculator?.subtract(operand1: "3.516251", operand2: "1.5484")
        XCTAssertTrue(expected == actual)
    }
    
    func testSubtractWithLargeOperand2ShouldPass() throws {
        let expected = "-16.1812"
        let actual = calculator?.subtract(operand1: "8.645", operand2: "24.8262")
        XCTAssertTrue(expected == actual)
    }
    
    func testMultiplyWithValidOperandsShouldPass() throws {
        let expected = "1512"
        let actual = calculator?.multiply(operand1: "54", operand2: "28")
        XCTAssertTrue(expected == actual)
    }
    
    func testMultiplyWithValidDecimalOperandsShouldPass() throws {
        let expected = "108.475"
        let actual = calculator?.multiply(operand1: "2.592", operand2: "41.85")
        XCTAssertTrue(expected == actual)
    }
    
    func testMultiplyWithInvalidOperandsShouldLeaveMessage() throws {
        let expected = INVALID_OPERATION
        let actual = calculator?.multiply(operand1: "12", operand2: "Not a number")
        XCTAssertTrue(expected == actual)
    }
    
    func testMultiplyWithZeroAsOperandShouldPass() throws {
        let expected = "0"
        let actual = calculator?.multiply(operand1: "4.506", operand2: "0")
        XCTAssertTrue(expected == actual)
    }
    
    func testMultiplyWithNegativeOperandShouldPass() throws {
        let expected = "-169.78"
        let actual = calculator?.multiply(operand1: "-32.65", operand2: "5.20")
        XCTAssertTrue(expected == actual)
    }
    
    func testDivideWithValidOperandsShouldPass() throws {
        let expected = "14"
        let actual = calculator?.divide(operand1: "56", operand2: "4")
        XCTAssertTrue(expected == actual)
    }
    
    func testDivideWithValidDecimalOperandsShouldPass() throws {
        let expected = "18.1635"
        let actual = calculator?.divide(operand1: "96.63", operand2: "5.32")
        XCTAssertTrue(expected == actual)
    }
    
    func testDivideWithInvalidOperandsShouldLeaveMessage() throws {
        let expected = INVALID_OPERATION
        let actual = calculator?.divide(operand1: "6", operand2: "Not a number")
        XCTAssertTrue(expected == actual)
    }
    
    func testDivideWithZeroAsOperand1ShouldPass() throws {
        let expected = "0"
        let actual = calculator?.divide(operand1: "0", operand2: "42.4")
        XCTAssertTrue(expected == actual)
    }
    
    func testDivideWithZeroAsOperand2ShouldLeaveMessage() throws {
        let expected = INVALID_OPERATION
        let actual = calculator?.divide(operand1: "32.75", operand2: "0")
        XCTAssertTrue(expected == actual)
    }
    
    func testDivideWithNegativeOperandShouldPass() throws {
        let expected = "-16.325"
        let actual = calculator?.divide(operand1: "-32.65", operand2: "2")
        XCTAssertTrue(expected == actual)
    }
    
    func testSineWithValidDegreesShouldPass() throws {
        let expected = "1"
        let actual = calculator?.sineOf(degrees: "90")
        XCTAssertTrue(expected == actual)
    }
    
    func testSineWithNegativeDegreesShouldPass() throws {
        let expected = "-0.0348995"
        let actual = calculator?.sineOf(degrees: "-362")
        XCTAssertTrue(expected == actual)
    }
    
    func testSineWithInvalidDegreesShouldLeaveMessage() throws {
        let expected = INVALID_OPERATION
        let actual = calculator?.sineOf(degrees: "Not a number")
        XCTAssertTrue(expected == actual)
    }
    
    func testSineWithLargeNumberShouldPass() throws {
        let expected = "0.669131"
        let actual = calculator?.sineOf(degrees: "3264519338778")
        XCTAssertTrue(expected == actual)
    }
    
    func testCosineWithValidDegreesShouldPass() throws {
        let expected = "1"
        let actual = calculator?.cosineOf(degrees: "93600")
        XCTAssertTrue(expected == actual)
    }
    
    func testCosineWithNegativeDegreesShouldPass() throws {
        let expected = "0.358368"
        let actual = calculator?.cosineOf(degrees: "-651")
        XCTAssertTrue(expected == actual)
    }
    
    func testCosineWithInvalidDegreesShouldLeaveMessage() throws {
        let expected = INVALID_OPERATION
        let actual = calculator?.cosineOf(degrees: "Not a number")
        XCTAssertTrue(expected == actual)
    }
    
    func testCosineWithLargeNumberShouldPass() throws {
        let expected = "-0.920506"
        let actual = calculator?.cosineOf(degrees: "6592625119957")
        XCTAssertTrue(expected == actual)
    }
    
    func testTangentWithValidDegreesShouldPass() throws {
        let expected = "0"
        let actual = calculator?.tangentOf(degrees: "0")
        XCTAssertTrue(expected == actual)
    }
    
    func testTangentForInfinityShouldPass() throws {
        let expected = INFINITY
        let actual = calculator?.tangentOf(degrees: "90")
        XCTAssertTrue(expected == actual)
    }
    
    func testTangentWithNegativeDegreesShouldPass() throws {
        let expected = "0"
        let actual = calculator?.tangentOf(degrees: "-180")
        XCTAssertTrue(expected == actual)
    }
    
    func testTangentWithInvalidDegreesShouldLeaveMessage() throws {
        let expected = INVALID_OPERATION
        let actual = calculator?.tangentOf(degrees: "Not a number")
        XCTAssertTrue(expected == actual)
    }
    
    func testTangentWithLargeNumberShouldPass() throws {
        let expected = "0.509525"
        let actual = calculator?.tangentOf(degrees: "178172307")
        XCTAssertTrue(expected == actual)
    }
    
    func testCosecantWithValidDegreesShouldPass() throws {
        let expected = "2"
        let actual = calculator?.cosecantOf(degrees: "30")
        XCTAssertTrue(expected == actual)
    }
    
    func testCosecantForInfinityShouldPass() throws {
        let expected = INFINITY
        let actual = calculator?.cosecantOf(degrees: "180")
        XCTAssertTrue(expected == actual)
    }
    
    func testCosecantWithNegativeDegreesShouldPass() throws {
        let expected = "-1.30541"
        let actual = calculator?.cosecantOf(degrees: "-50")
        XCTAssertTrue(expected == actual)
    }
    
    func testCosecantWithInvalidDegreesShouldLeaveMessage() throws {
        let expected = INVALID_OPERATION
        let actual = calculator?.cosecantOf(degrees: "Not a number")
        XCTAssertTrue(expected == actual)
    }
    
    func testCosecantWithLargeNumberShouldPass() throws {
        let expected = "-2.06266"
        let actual = calculator?.cosecantOf(degrees: "5498129")
        XCTAssertTrue(expected == actual)
    }
    
    func testSecantWithValidDegreesShouldPass() throws {
        let expected = "1"
        let actual = calculator?.secantOf(degrees: "0")
        XCTAssertTrue(expected == actual)
    }
    
    func testSecantForInfinityShouldPass() throws {
        let expected = INFINITY
        let actual = calculator?.secantOf(degrees: "90")
        XCTAssertTrue(expected == actual)
    }
    
    func testSecantWithNegativeDegreesShouldPass() throws {
        let expected = "-1.06418"
        let actual = calculator?.secantOf(degrees: "-200")
        XCTAssertTrue(expected == actual)
    }
    
    func testSecantWithInvalidDegreesShouldLeaveMessage() throws {
        let expected = INVALID_OPERATION
        let actual = calculator?.secantOf(degrees: "Not a number")
        XCTAssertTrue(expected == actual)
    }
    
    func testSecantWithLargeNumberShouldPass() throws {
        let expected = "-1.20622"
        let actual = calculator?.secantOf(degrees: "7624928734")
        XCTAssertTrue(expected == actual)
    }
    
    func testCotangentWithValidDegreesShouldPass() throws {
        let expected = "0"
        let actual = calculator?.cotangentOf(degrees: "90")
        XCTAssertTrue(expected == actual)
    }
    
    func testCotangentForInfinityShouldPass() throws {
        let expected = INFINITY
        let actual = calculator?.cotangentOf(degrees: "180")
        XCTAssertTrue(expected == actual)
    }
    
    func testCotangentWithNegativeDegreesShouldPass() throws {
        let expected = "-1.19175"
        let actual = calculator?.cotangentOf(degrees: "-40")
        XCTAssertTrue(expected == actual)
    }
    
    func testCotangentWithInvalidDegreesShouldLeaveMessage() throws {
        let expected = INVALID_OPERATION
        let actual = calculator?.cotangentOf(degrees: "Not a number")
        XCTAssertTrue(expected == actual)
    }
    
    func testCotangentWithLargeNumberShouldPass() throws {
        let expected = "0.869286"
        let actual = calculator?.cotangentOf(degrees: "4976329")
        XCTAssertTrue(expected == actual)
    }
    
    func testPrimeTrigonometricInputs() {
        XCTAssertTrue("0" == calculator?.sineOf(degrees: "0"))
        XCTAssertTrue("1" == calculator?.sineOf(degrees: "90"))
        XCTAssertTrue("0" == calculator?.sineOf(degrees: "180"))
        
        XCTAssertTrue("1" == calculator?.cosineOf(degrees: "0"))
        XCTAssertTrue("0" == calculator?.cosineOf(degrees: "90"))
        XCTAssertTrue("-1" == calculator?.cosineOf(degrees: "180"))
        
        XCTAssertTrue("0" == calculator?.tangentOf(degrees: "0"))
        XCTAssertTrue(INFINITY == calculator?.tangentOf(degrees: "90"))
        XCTAssertTrue("0" == calculator?.tangentOf(degrees: "180"))
        
        XCTAssertTrue(INFINITY == calculator?.cosecantOf(degrees: "0"))
        XCTAssertTrue("1" == calculator?.cosecantOf(degrees: "90"))
        XCTAssertTrue(INFINITY == calculator?.cosecantOf(degrees: "180"))
        
        XCTAssertTrue("1" == calculator?.secantOf(degrees: "0"))
        XCTAssertTrue(INFINITY == calculator?.secantOf(degrees: "90"))
        XCTAssertTrue("-1" == calculator?.secantOf(degrees: "180"))
        
        XCTAssertTrue(INFINITY == calculator?.cotangentOf(degrees: "0"))
        XCTAssertTrue("0" == calculator?.cotangentOf(degrees: "90"))
        XCTAssertTrue(INFINITY == calculator?.cotangentOf(degrees: "180"))
    }
}
