//
//  ButtonInput.swift
//  CalculatorClone
//
//  Created by 김남건 on 2022/05/28.
//

import Foundation
import SwiftUI

enum ButtonContent {
    case reset, plusMinus, percent,
         one, two, three, four, five, six, seven, eight, nine, zero, dot,
         divide, multiply, minus, plus, equals

    var backgroundColor: Color {
        switch self {
        case .reset, .plusMinus, .percent:
            return Color(UIColor.systemGray2)
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .dot:
            return Color(UIColor.systemGray6)
        case .divide, .multiply, .minus, .plus, .equals:
            return .orange
        }
    }

    var foregroundColor: Color {
        switch self {
        case .reset, .plusMinus, .percent:
            return .black
        default:
            return .white
        }
    }
}
