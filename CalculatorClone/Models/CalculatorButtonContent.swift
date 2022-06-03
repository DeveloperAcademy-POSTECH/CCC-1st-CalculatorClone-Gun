//
//  ButtonInput.swift
//  CalculatorClone
//
//  Created by 김남건 on 2022/05/28.
//

import Foundation
import SwiftUI

enum CalculatorButtonContent: Hashable {
    case reset(Bool), plusMinus, percent,
         one, two, three, four, five, six, seven, eight, nine, zero, dot,
         divide(Bool), multiply(Bool), minus(Bool), plus(Bool), equals

    var label: some View {
        Group {
            switch self {
            case .reset(let isReset):
                isReset ? Text("AC") : Text("C")
            case .plusMinus:
                Image(systemName: "plus.forwardslash.minus")
            case .percent:
                Text("%")
            case .one:
                Text("1")
            case .two:
                Text("2")
            case .three:
                Text("3")
            case .four:
                Text("4")
            case .five:
                Text("5")
            case .six:
                Text("6")
            case .seven:
                Text("7")
            case .eight:
                Text("8")
            case .nine:
                Text("9")
            case .zero:
                Text("0")
            case .dot:
                Text(".")
            case .divide:
                Image(systemName: "divide")
            case .multiply:
                Image(systemName: "multiply")
            case .minus:
                Image(systemName: "minus")
            case .plus:
                Image(systemName: "plus")
            case .equals:
                Image(systemName: "equal")
            }
        }
    }
}
