//
//  ContentView.swift
//  CalculatorClone
//
//  Created by 김남건 on 2022/05/28.
//

import SwiftUI

struct CalculatorScreen: View {
    @State private var currentInput = 0.0
    @State private var isReset = true

    init() {
        currentInput = 0.0
        isReset = true
    }

    var body: some View {
        VStack(spacing: 5) {
            Spacer()
            Text("\(Int(currentInput))")
                .font(.system(size: 85, weight: .thin))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 15)
            VStack(spacing: Constants.buttonSpacing) {
                let buttonContentRows: [[CalculatorButtonContent]] = [
                    [.reset(isReset), .plusMinus, .percent, .divide],
                    [.seven, .eight, .nine, .multiply],
                    [.four, .five, .six, .minus],
                    [.one, .two, .three, .plus],
                    [.zero, .dot, .equals]
                ]

                ForEach(buttonContentRows, id: \.self) { buttonContentRow in
                    HStack(spacing: Constants.buttonSpacing) {
                        ForEach(buttonContentRow, id: \.self) { buttonContent in
                            Button {
                                isReset.toggle()
                            } label: {
                                buttonContent.label
                            }
                            .buttonStyle(CalculatorButtonStyle(buttonContent: buttonContent))
                        }
                    }
                }
            }
        }
        .padding(.horizontal, Constants.buttonSpacing)
        .padding(.vertical, 30)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorScreen()
    }
}
