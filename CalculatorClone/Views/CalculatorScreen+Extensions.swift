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
        case .minus:
            currentOperator = 2
        case .plus:
            currentOperator = 3
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            clickDigit(buttonContent)
        default:
            break
        }
    }

    func clickDigit(_ digit: CalculatorButtonContent) {
        let digitArr: [CalculatorButtonContent] = [.zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine]
        let digitValue = digitArr.firstIndex(of: digit)!

        switch currentPhase {
        case .writingValue:
            unformattedValueString += "\(digitValue)"
        default:
            break
        }
    }
}
