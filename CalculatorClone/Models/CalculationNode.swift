//
//  CalculationNode.swift
//  CalculatorClone
//
//  Created by 김남건 on 2022/06/08.
//

import Foundation

struct CalculationNode {
    let calcOperator: CalculatorButtonContent?
    var calcOperand: Double

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

    var priority: Int {
        switch calcOperator {
        case .plus:
            return 1
        case .minus:
            return 1
        case .multiply:
            return 2
        case .divide:
            return 2
        default:
            return 0
        }
    }
}
