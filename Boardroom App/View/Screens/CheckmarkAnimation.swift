//
//  CheckmarkAnimation.swift
//  Boardroom App
//
//  Created by Sara AlQuwaifli on 19/02/2024.
//

import SwiftUI

struct CheckmarkAnimation: View {
    @State var borderInit: Bool = false
    @State var spinArrow: Bool = false
    @State var dismissArrow: Bool = false
    @State var displayCheckmark: Bool = true
    
      @State private var transition = false
      
     let g =  LinearGradient(
          gradient: Gradient(
              colors: [
                       Color("Orange"), // Orange with reduced opacity
                       Color("DarkBlue"), // Dark Blue with reduced opacity
                       Color("Orange"), // Orange with reduced opacity
                       Color("DarkBlue") // Dark Blue with reduced opacity
                   ]
          ),
          startPoint: .topLeading,
          endPoint: .bottomTrailing
      )



    var body: some View {
      ZStack {
        // Border
          Circle()
              .stroke(g, lineWidth: 15) // Adjust line width as needed
            .frame(width: 200, height: 180) // Adjust size as needed

          Circle()
              .stroke(Color("Orange") , lineWidth: 10) // Adjust line width as needed
            .frame(width: 200, height: 138) // Adjust size as needed

        Circle()
          .strokeBorder(style: StrokeStyle(lineWidth: borderInit ? 5 : 64))
          .frame(width: 128, height: 128)
          .foregroundColor(Color("DarkBlue"))
          .animation(.easeOut(duration: 3).speed(1.5))
                .onAppear() {
                  borderInit.toggle()
                }
        
        // Arrow Icon
          Image(systemName: "checkmark")
              .font(.system(size: 50, weight: .bold))
              .foregroundColor(Color("DarkBlue"))
          .rotationEffect(.degrees(spinArrow ? 360 : -360))
          .opacity(dismissArrow ? 0 : 1)
          .animation(.easeOut(duration: 2))
          .onAppear() {
            spinArrow.toggle()
            withAnimation(Animation.easeInOut(duration: 1).delay(1)) {
                transition.toggle()

            }
          }
        
       
      }
    }
      
  }
