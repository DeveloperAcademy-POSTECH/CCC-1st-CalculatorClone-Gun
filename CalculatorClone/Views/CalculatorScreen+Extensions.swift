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
            reset()
        case .divide, .multiply, .minus, .plus:
            clickOperator(buttonContent)
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            clickDigit(buttonContent)
        case .equals:
            calculate()
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
            calculationNodes.append(newNode)
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

    func calculateAndRemove(in nodes: inout [CalculationNode], at index: Int) {
        let removedNode = nodes[index]
        let leftOperand = nodes[index - 1].calcOperand
        let rightOperand = removedNode.calcOperand

        nodes[index - 1].calcOperand = removedNode
            .realOperator(leftOperand, rightOperand)

        nodes.remove(at: index)
    }

    var calculationResult: Double {
        if self.calculationNodes.isEmpty {
            return currentValue!
        }

        var calculationNodes = self.calculationNodes

        while calculationNodes.count > 1 {
            if let firstRemovedIndex = calculationNodes.firstIndex(where: { node in node.priority == 2 }) {
               calculateAndRemove(in: &calculationNodes, at: firstRemovedIndex)
            } else if let firstRemovedIndex = calculationNodes.firstIndex(where: { node in node.priority == 1 }) {
                calculateAndRemove(in: &calculationNodes, at: firstRemovedIndex)
            }
        }

        return calculationNodes[0].calcOperand
    }

    func calculate() {
        if currentPhase == .writingValue {
            let newNode = CalculationNode(calcOperator: currentOperator, calcOperand: currentValue!)
            calculationNodes.append(newNode)
        }

        currentValue = calculationResult
        calculationNodes.removeAll()
        currentOperatorIndex = nil
        currentPhase = .finished
    }

    func reset() {
        currentPhase = .writingValue
        unformattedValueString = "0"
        calculationNodes.removeAll()
        isReset = true
    }
}
