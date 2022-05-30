//
//  CalculatorButtonStyle+Extensions.swift
//  CalculatorClone
//
//  Created by 김남건 on 2022/05/28.
//

import Foundation
import SwiftUI

extension CalculatorButtonStyle {
    var backgroundColor: Color {
        switch buttonContent {
        case .reset, .plusMinus, .percent:
            return Color(UIColor.systemGray2)
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .dot:
            return Color(UIColor.systemGray6)
        case .divide, .multiply, .minus, .plus, .equals:
            return .orange
        }
    }

    var foregroundColor: Color {
        switch buttonContent {
        case .reset, .plusMinus, .percent:
            return .black
        default:
            return .white
        }
    }
    
    var unitlength: CGFloat {
        (UIScreen.main.bounds.width - 4 * Constants.buttonSpacing) / 4
    }

    var width: CGFloat {
        buttonContent == .zero ? 177 : 82.5
    }

    var horizontalPadding: CGFloat {
        buttonContent == .zero ? 30 : 0
    }

    var alignment: Alignment {
        buttonContent == .zero ? .leading : .center
    }

    var fontSize: CGFloat {
        switch buttonContent {
        case .plusMinus, .divide, .multiply:
            return 30
        default:
            return 40
        }
    }

    var fontWeight: Font.Weight {
        switch buttonContent {
        case .divide, .multiply, .minus, .plus, .equals:
            return .semibold
        default:
            return .regular
        }
    }
}
