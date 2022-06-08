//
//  CalculationNode.swift
//  CalculatorClone
//
//  Created by 김남건 on 2022/06/08.
//

import Foundation

struct CalculationNode {
    let calcOperator: CalculatorButtonContent?
    let calcOperand: Double

    var realOperator: (Double, Double) -> Double {
        switch calcOperator {
        case .plus:
            return (+)
        case .minus:
            return (-)
        case .multiply:
            return (*)
        case .divide:
            return (/)
        default:
            fatalError()
        }
    }
}
