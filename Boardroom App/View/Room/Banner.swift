//
//  Banner.swift
//  Boardroom App
//
//  Created by Zinab Zooba on 15/08/1445 AH.
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            Spacer()
            Image("banner")
                .resizable()
                .frame(width: 358, height: 138)
                .overlay {
                    VStack(alignment: .leading) {
                        Text("All board rooms")
                            .fontWeight(.thin)
                            .foregroundColor(.white)
                            .padding(.leading)
                        Text("Available today")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom)
                            .padding(.leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Text("Book now")
                            .fontWeight(.thin)
                            .foregroundColor(.white)
                            .padding(.top, 60)
                            .padding(.leading, 220)
                        
                        Image(systemName: "arrowshape.right.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.white)
                            .padding(.top, 60)
                            .padding(.leading, 10)
                    }
                } .padding()

        }}
}
#Preview {
    BannerView()
}
