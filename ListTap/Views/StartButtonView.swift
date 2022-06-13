//
//  StartButtonView.swift
//  ListTap
//
//  Created by Damian on 13/06/2022.
//

import SwiftUI


struct StartButtonView: View {
    @State private var textButton = "START"
    @State private var color: Color = Color.myGreen
    @State private var isRunning = false
    @Binding var arrayOfElements: [ElementView]
    
    var body: some View {
        Button {
            isRunning.toggle()
            if isRunning {
                textButton = "STOP"
                color = Color.myRed
            } else {
                textButton = "START"
                color = Color.myGreen
            }
            
            Task.detached {
                while isRunning {
                        ticking()
                    }
            }
        } label: {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(color)
                    Text(textButton)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                }
                .frame(height: 60)
            }
            .padding()
        }
        .buttonStyle(.plain)
    }
    
    func ticking() {
        sleep(1)
        if arrayOfElements.count < 5 {
            arrayOfElements.append(ElementView())
        } else {
            let chance = Int.random(in: 0...99)
            let i = arrayOfElements.indices.randomElement()!
            
            func addValue(_ index: Int) {
                var indexPrev = 0
                if index == 0 {
                    indexPrev = 4
                } else {
                    indexPrev = index - 1
                }
                arrayOfElements[index].value += arrayOfElements[indexPrev].value
            }
            
            func deleteRandomElement(_ index: Int) {
                arrayOfElements.remove(at: index)
            }
            func resetRandomElementCounter(_ index: Int) {
                arrayOfElements[index].value = 0
            }
            func incrementRandomElement(_ index: Int) {
                arrayOfElements[index].value += 1
            }
            
            switch chance {
            case 0...9:
                addValue(i)
                
            case 10...19:
                deleteRandomElement(i)
                
            case 20...49:
                resetRandomElementCounter(i)
                
            default:
                incrementRandomElement(i)
            }
        }
    }
}
