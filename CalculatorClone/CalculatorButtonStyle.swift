//
//  CalculatorButtonStyle.swift
//  CalculatorClone
//
//  Created by 김남건 on 2022/05/28.
//

import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    let buttonContent: CalculatorButtonContent

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 41.25)
                .foregroundColor(backgroundColor)
            configuration.label
                .foregroundColor(foregroundColor)
                .font(.system(size: fontSize, weight: weight))
                .padding(.horizontal, horizontalPadding)
                .frame(width: width, alignment: alignment)
        }
        .frame(width: width, height: 82.5)
    }
}

struct CalculatorButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 12) {
            Button {

            } label: {
                CalculatorButtonContent.zero.label
            }
            .buttonStyle(CalculatorButtonStyle(buttonContent: .zero))

            Button(action: {

            }, label: {
                Image(systemName: "divide")
            })
            .buttonStyle(CalculatorButtonStyle(buttonContent: .multiply))
        }
        .preferredColorScheme(.dark)
    }
}
