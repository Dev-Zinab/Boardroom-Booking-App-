//
//  Roomditiles.swift
//  Boardroom App
//
//  Created by Zinab Zooba on 15/08/1445 AH.
//

import SwiftUI

struct FacilitiesView: View {
    var facilities: [String]
    
    var body: some View {
        HStack {
            ForEach(facilities, id: \.self) { facility in
                FacilityIconView(facility: facility)
            }
        }
        .frame(width: 10, height: 10)

        .background(Rectangle().fill(Color.pearly).frame(width: 23, height: 20).cornerRadius(4))
        .padding(.trailing, 140)
        .foregroundColor(.black)
    }
}

struct FacilityIconView: View {
    var facility: String
    
    var body: some View {
        switch facility {
        case "Wifi": return AnyView(Image(systemName: "wifi"))
        case "Screen": return AnyView(Image(systemName: "tv"))
        case "microphone": return AnyView(Image(systemName: "mic"))
        case "projector": return AnyView(Image(systemName: "videoprojector"))
        default: return AnyView(EmptyView())
        }
    }
}

#if DEBUG
//struct FacilitiesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FacilitiesView(facilities: ["Wifi", "Screen", "microphone"])
//    }
//}
#endif
struct FacilitiesView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
