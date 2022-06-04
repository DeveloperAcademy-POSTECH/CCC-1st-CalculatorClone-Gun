//
//  ContentView.swift
//  CalculatorClone
//
//  Created by 김남건 on 2022/05/28.
//

import SwiftUI

struct CalculatorScreen: View {
    @State private var currentInput = 0.0
    @State var isReset = true {
        didSet {
            buttonContentRows[0][0] = .reset(isReset)
        }
    }
    @State var currentOperator: Int? {
        didSet {
            buttonContentRows[0][3] = .divide(currentOperator == 0)
            buttonContentRows[1][3] = .multiply(currentOperator == 1)
            buttonContentRows[2][3] = .minus(currentOperator == 2)
            buttonContentRows[3][3] = .plus(currentOperator == 3)
        }
    }
    @State private var buttonContentRows: [[CalculatorButtonContent]] = []

    init() {
        _buttonContentRows = State(initialValue: [
            [.reset(isReset), .plusMinus, .percent, .divide(false)],
            [.seven, .eight, .nine, .multiply(false)],
            [.four, .five, .six, .minus(false)],
            [.one, .two, .three, .plus(false)],
            [.zero, .dot, .equals]
        ])
    }

    var body: some View {
        VStack(spacing: 5) {
            Spacer()
            Text("\(Int(currentInput))")
                .font(.system(size: 85, weight: .thin))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 15)
            VStack(spacing: Constants.buttonSpacing) {
                ForEach(buttonContentRows, id: \.self) { buttonContentRow in
                    HStack(spacing: Constants.buttonSpacing) {
                        ForEach(buttonContentRow, id: \.self) { buttonContent in
                            Button {
                                clickButton(with: buttonContent)
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
