import SwiftUI

struct RoomRowView: View {
    var room: RoomModel
    
    var body: some View {
        
        
        VStack {
                HStack{
                    AsyncImage(url: URL(string: room.fields.imageURL)) { image in
                        image
                            .resizable()
                            .frame(width: 106, height: 106)
                            .cornerRadius(5)


                    } placeholder: {
                        Rectangle()
                            .frame(width: 106, height: 106)
                    }.padding()
                    Spacer()
                    
                    VStack {
                        Text(room.fields.name)
                            .bold()
                            .padding(.trailing, 70)
                            .fixedSize(horizontal: true, vertical: false) //هذا انقذني

                            .foregroundColor(.black)

                        
                        Text("Floor: \(room.fields.floorNo)")
                            .font(.caption)
                            .foregroundStyle(.gray)
                            .padding(.trailing, 140)
                            .fixedSize(horizontal: true, vertical: false) //هذا انقذني

                        
                        HStack {
                            Image(systemName: "person.2")
                                .resizable()
                                .frame(width: 18, height: 16)
                                .foregroundColor(.orange)
                                .background(Rectangle().fill(Color.pearly).frame(width: 23, height: 20)
                                    .cornerRadius(4))

                            
                            
                            Text(String(room.fields.noOfSeats))
                                .font(.subheadline)
                                .foregroundColor(.orange)
                                .background(Rectangle().fill(Color.pearly).frame(width: 23, height: 20).cornerRadius(4))

                        }
                        .padding(.trailing, 140)
                        .fixedSize(horizontal: true, vertical: false) //هذا انقذني

                        FacilitiesView(facilities: room.fields.facilities)
                    }.offset(x:-20)
                    .background(Color.white)

                    
                } 
                }   .frame(width: 358, height: 128)
                    .background(.white)
                    .cornerRadius(8)
            Spacer()
        }
    }


struct RoomRowView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
