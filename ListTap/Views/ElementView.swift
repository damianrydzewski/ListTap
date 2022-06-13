//
//  ElementView.swift
//  ListTap
//
//  Created by Damian on 13/06/2022.
//

import SwiftUI

//adding custom colors
extension Color {
    public static var myGreen: Color {
        return Color(red: 98/255, green: 205/255, blue: 164/255)
    }
    
    public static var myRed: Color {
        return Color(red: 238/255, green: 127/255, blue: 126/255)
    }
    
    public static var myBlue: Color {
        return Color(red: 118/255, green: 215/255, blue: 247/255)
    }
}


//ElementView
struct ElementView: View, Identifiable, Equatable {
    let id = UUID()
    let color: Color
    var value: Int
    
    var showedValue: Int {
        if color == Color.myRed {
            return value * 3
        } else {
            return value
        }
    }
    
    init(){
        self.color = [Color.myRed, Color.myBlue].randomElement()!
        self.value = Int.random(in: 0...10)
    }
    
    
    var body: some View {
        VStack {
            ZStack {
                HStack(spacing: 20) {
                    Circle()
                        .frame(width: 55)
                        .foregroundColor(color)
                    
                    Text(showedValue, format: .number)
                        .font(.system(size: 20))
                    Spacer()
                }
            }
            .background(.white)
            .frame(width: .infinity, height: 80)
        }
        .padding(.horizontal)
    }
}

struct ElementView_Previews: PreviewProvider {
    static var previews: some View {
        ElementView()
    }
}

