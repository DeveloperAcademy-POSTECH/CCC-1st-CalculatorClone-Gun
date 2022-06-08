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
        case .divide, .multiply, .minus, .plus:
            clickOperator(buttonContent)
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            clickDigit(buttonContent)
        default:
            break
        }
    }

    func changeOperatorButtonColor() {
        buttonContentRows[0][3] = .divide(currentPhase == .choosingOperator && currentOperatorIndex == 0)
        buttonContentRows[1][3] = .multiply(currentPhase == .choosingOperator && currentOperatorIndex == 1)
        buttonContentRows[2][3] = .minus(currentPhase == .choosingOperator && currentOperatorIndex == 2)
        buttonContentRows[3][3] = .plus(currentPhase == .choosingOperator && currentOperatorIndex == 3)
    }

    func clickDigit(_ digit: CalculatorButtonContent) {
        let digitArr: [CalculatorButtonContent] = [.zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine]
        let digitValue = digitArr.firstIndex(of: digit)!

        switch currentPhase {
        case .writingValue:
            unformattedValueString += "\(digitValue)"
        case .choosingOperator, .finished:
            unformattedValueString = "\(digitValue)"
        }

        currentPhase = .writingValue
        changeOperatorButtonColor()
    }

    func clickOperator(_ newOperator: CalculatorButtonContent) {
        switch currentPhase {
        case .writingValue, .finished:
            let newNode = CalculationNode(calcOperator: currentOperator, calcOperand: currentValue!)
            calcuationNodes.append(newNode)
        case .choosingOperator:
            break
        }

        var newOperatorIndex = 0

        switch newOperator {
        case .divide:
            newOperatorIndex = 0
        case .multiply:
            newOperatorIndex = 1
        case .minus:
            newOperatorIndex = 2
        case .plus:
            newOperatorIndex = 3
        default:
            fatalError()
        }

        currentPhase = .choosingOperator
        currentOperatorIndex = newOperatorIndex
    }
}
