//
//  CalculatorScreen+Extensions.swift
//  CalculatorClone
//
//  Created by 김남건 on 2022/06/04.
//

import Foundation

extension CalculatorScreen {
    func clickButton(with buttonContent: CalculatorButtonContent) {
        switch buttonContent {
        case .reset:
            isReset = true
        case .divide:
            currentOperator = 0
        case .multiply:
            currentOperator = 1
        case .plus:
            currentOperator = 2
        case .minus:
            currentOperator = 3
        default:
            break
        }
    }
}
