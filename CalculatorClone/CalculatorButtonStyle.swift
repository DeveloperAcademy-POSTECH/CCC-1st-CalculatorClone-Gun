//
//  CalculatorButtonStyle.swift
//  CalculatorClone
//
//  Created by 김남건 on 2022/05/28.
//

import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    let buttonContent: ButtonContent

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

    var width: CGFloat {
        buttonContent == .zero ? 177 : 82.5
    }

    var horizontalPadding: CGFloat {
        buttonContent == .zero ? 30 : 0
    }

    var alignment: Alignment {
        buttonContent == .zero ? .leading : .center
    }

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 41.25)
                .foregroundColor(backgroundColor)
            configuration.label
                .foregroundColor(foregroundColor)
                .font(.system(size: 40, weight: .regular))
                .padding(.horizontal, horizontalPadding)
                .frame(width: width, alignment: alignment)
        }
        .frame(width: width, height: 82.5)
    }
}

struct CalculatorButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 12) {
            Button("0", action: {})
                .buttonStyle(CalculatorButtonStyle(buttonContent: .zero))
            Button(".", action: {})
                .buttonStyle(CalculatorButtonStyle(buttonContent: .dot))
            Button("=", action: {})
                .buttonStyle(CalculatorButtonStyle(buttonContent: .equals))
        }
        .preferredColorScheme(.dark)
    }
}
