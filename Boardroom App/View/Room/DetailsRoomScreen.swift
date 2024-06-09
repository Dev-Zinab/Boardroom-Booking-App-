//
//  DetailsRoomScreen.swift
//  Boardroom App
//
//  Created by Sara AlQuwaifli on 19/02/2024.
//

import SwiftUI
import Foundation

struct DetailsRoomScreen: View {
    var room: RoomModel

    
    var body: some View {
        
        
        ZStack{
            Color(.white)
            .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 16) {
                
                
              
                    
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: room.fields.imageURL)) { image in
                        image
                        
                            .resizable()

                            .frame(width: .infinity, height: 323)


                    } placeholder: {
                        Rectangle()
                            .frame(width: 106, height: 106)
                    }


                    HStack {
                        Image(systemName: "person.2")
                            .resizable()
                            .frame(width: 18, height: 16)
                            .padding(.leading, 8)
                            .foregroundColor(.orange)

                        
                        Text(String(room.fields.noOfSeats))
                            .font(.subheadline)
                            .foregroundStyle(.orange)
                        
                        Spacer()
                        Text("Floor: \(room.fields.floorNo)")                            .padding(.trailing, 8)

                    }

                        Text ("Description")
                            .font(.title2)
                            .padding()
                        
                    Text(room.fields.description)
                            .background(.white)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true) //هذا انقذني
                        .padding()
                    
                    Text ("Facilities")
                        .font(.title2)
                        .padding()


//                    HStack {
//                        FacilitiesView(facilities: room.fields.facilities)
//
//                    ForEach(0..<min(imageNames.count, imageDes.count), id: \.self) { index in
//                        
//                            Image(systemName: imageNames[index])
//                            .resizable()
//                            .frame(width: 15, height: 16)
//                            .foregroundColor(.black)
//
//                            Text(" \(imageDes[index])")
//                        
//                        } .background(
//                            Rectangle().fill(.white).frame(width: .infinity, height: 20))
//
//
//                    
//                        }.padding()

                        
                    NumberOfDaysPicker()

                    Button(action: {
                        
                    }) {
                        Text("Booking")
                            .frame(width: 358, height: 50)
                            .background(Color("Orange"))
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .padding()
                            .offset(x:20, y:-22)
                    }

                    }

                        
                        
                    }
                    
        }
            .navigationBarTitle(room.fields.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color("DarkBlue"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)

                

            
            
            
        }
    }


#Preview {
DetailsRoomScreen(room: RoomModel(id: "String", createdTime: "", fields: Fields(imageURL: "room.fields.imageURL", noOfSeats: 0, floorNo: 0, description: "", facilities: ["String"], id: "", name: "")))}
