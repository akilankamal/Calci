//
//  String+Extension.swift
//  Calci
//
//  Created by Akilan on 11/09/20.
//  Copyright © 2020 aki. All rights reserved.
//

import Foundation

extension String {
    func readable() -> String {
        switch self {
        case "0.0", "-0", "-0.0":
            return "0"
        default:
            return self
        }
    }
}
