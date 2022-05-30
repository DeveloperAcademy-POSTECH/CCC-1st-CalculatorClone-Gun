//
//  ContentView.swift
//  CalculatorClone
//
//  Created by 김남건 on 2022/05/28.
//

import SwiftUI

struct CalculatorScreen: View {
    @State private var currentInput = 0.0
    let buttonContentRows: [[CalculatorButtonContent]] = [
        [.reset, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equals]
    ]

    var body: some View {
        VStack {
            Spacer()
            Text("\(Int(currentInput))")
                .font(.system(size: 85, weight: .thin))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 15)
                .padding(.bottom, 5)
            ForEach(buttonContentRows, id: \.self) { buttonContentRow in
                HStack {
                    ForEach(buttonContentRow, id: \.self) { buttonContent in
                        Button {

                        } label: {
                            buttonContent.label
                        }
                        .buttonStyle(CalculatorButtonStyle(buttonContent: buttonContent))
                    }
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 30)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorScreen()
    }
}
