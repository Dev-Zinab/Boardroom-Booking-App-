//
//  SuccessScreen.swift
//  Boardroom App
//
//  Created by Sara AlQuwaifli on 19/02/2024.
//

import SwiftUI

struct SuccessScreen: View {
    
    // state variables for the room and date
    @State var room = "Ideation Room"
    @State var date = Date.now
    
    
    // A formatter for the date
    var formattedDate: String {
          let formatter = DateFormatter()
          formatter.dateFormat = "EEEE, MMMM d, yyyy"
          return formatter.string(from: date)
      }
    
    
    var body: some View {
        
        
        ZStack {
            // background
            Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .overlay(
                        LinearGradient(
                                gradient: Gradient(colors: [.clear, .white]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .opacity(0.3)
                            .blendMode(.multiply)
                        )
            
            
           
            
            
            
            VStack {
                
                // SyncSpinner view shows the wholw circle and animation of the checkmark
                
                ZStack{
                    
                  
                    CheckmarkAnimation(displayCheckmark: true)
                }
                Spacer()
                
                Text("Booking Success!")
                    .foregroundColor(Color("DarkBlue"))
                    .font(.system(size: 32, weight: .bold))

                
                ZStack{
                    
                    
                    Text("Your booking for \(room) on \(formattedDate) is confirmed.")
                        .padding(.all, 20)
                    
                        .background(Color.white)
                        .cornerRadius(20)

                    
                }
                Spacer()
                
                
                // *** Action to be added to the button
                Button(action: {}) {
                    Text("Done")
                        .font(.headline)
                        .frame(width: 358, height: 50)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("Orange")))
                }
                
                
            }
            .padding(.vertical, 70)
            .padding(.horizontal, 20)
            
            
            
        }
    }
}


#Preview {
    SuccessScreen()
}
