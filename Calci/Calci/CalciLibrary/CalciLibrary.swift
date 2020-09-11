//
//  CalciLibrary.swift
//  Calci
//
//  Created by Akilan on 10/09/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

public class CalciLibrary: Calculatable {
    
    private let INVALID_OPERATION = "Invalid Operation"
    private let INFINITY = "∞"
    
    func add(operand1: String, operand2: String) -> String {
        guard let opr1 = Double(operand1), let opr2 = Double(operand2) else {
            return INVALID_OPERATION
        }
        let result = opr1 + opr2
        return String(format: "%g", result).readable()
    }
    
    func subtract(operand1: String, operand2: String) -> String {
        guard let opr1 = Double(operand1), let opr2 = Double(operand2) else {
            return INVALID_OPERATION
        }
        let result = opr1 - opr2
        
        return String(format: "%g", result).readable()
    }
    
    func multiply(operand1: String, operand2: String) -> String {
        guard let opr1 = Double(operand1), let opr2 = Double(operand2) else {
            return INVALID_OPERATION
        }
        let result = opr1 * opr2
        
        return String(format: "%g", result).readable()
    }
    
    func divide(operand1: String, operand2: String) -> String {
        guard let opr1 = Double(operand1), let opr2 = Double(operand2), opr2 != 0 else {
            return INVALID_OPERATION
        }
        let result = opr1 / opr2
        
        return String(format: "%g", result).readable()
    }
    
    func sineOf(degrees: String) -> String {
        guard let degrees = Double(degrees) else {
            return INVALID_OPERATION
        }
        return String(format: "%g", __sinpi(degrees/180.0)).readable()
    }
    
    func cosineOf(degrees: String) -> String {
        guard let degrees = Double(degrees) else {
            return INVALID_OPERATION
        }
        return String(format: "%g", __cospi(degrees/180.0)).readable()
    }
    
    func tangentOf(degrees: String) -> String {
        guard let degrees = Double(degrees) else {
            return INVALID_OPERATION
        }
        if degrees == 90 { return INFINITY }
        let result = String(format: "%g", __tanpi(degrees/180.0))
        return result == "inf" ? INFINITY : result.readable()
    }
    
    func cosecantOf(degrees: String) -> String {
        guard let doubleValue = Double(degrees) else {
            return INVALID_OPERATION
        }
        if doubleValue == 0 || doubleValue == 180 { return INFINITY }
        let result = divide(operand1: "1", operand2: sineOf(degrees: degrees))
        return result == "inf" ? INFINITY : result.readable()
    }
    
    func secantOf(degrees: String) -> String {
        guard let doubleValue = Double(degrees) else {
            return INVALID_OPERATION
        }
        if doubleValue == 90 { return INFINITY }
        let result = divide(operand1: "1", operand2: cosineOf(degrees: degrees))
        return result == "inf" ? INFINITY : result.readable()
    }
    
    func cotangentOf(degrees: String) -> String {
        guard let doubleValue = Double(degrees) else {
            return INVALID_OPERATION
        }
        if doubleValue == 0 || doubleValue == 180 { return INFINITY }
        if doubleValue == 90 { return "0" }
        let result = divide(operand1: "1", operand2: tangentOf(degrees: degrees))
        return result == "inf" ? INFINITY : result.readable()
    }
}
