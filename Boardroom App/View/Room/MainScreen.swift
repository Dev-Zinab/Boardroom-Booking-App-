import SwiftUI

struct MainScreen: View {
    @StateObject var viewModel = RoomViewModel()
    @State private var room: RoomModel?
    @State private var selectedDate = Date()

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.pearly)
                    .ignoresSafeArea()
                VStack {
                    BannerView()
                    
                    Text("My Booking")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    
                    NumberOfDaysPicker()
                    
                    LazyVStack {
                       
                            ForEach(viewModel.BoardRoom) { room in
                                NavigationLink(destination: DetailsRoomScreen(room: RoomModel(id: room.id, createdTime: room.createdTime, fields: room.fields))) {
                                    RoomRowView(room: room)
                                }
                            }
                        }                        .padding()

                } 
                
                
            }
            .onAppear {
                viewModel.fetch()
            }
            .task {
                do {
                    room = try await BoardroomTable()
                } catch {
                    print("Error fetching data: \(error)")
                }
            }

            .navigationTitle("Board Rooms")
             .navigationBarTitleDisplayMode(.inline)
             .toolbarBackground(Color("DarkBlue"), for: .navigationBar)
             .toolbarBackground(.visible, for: .navigationBar)
             .toolbarColorScheme(.dark, for: .navigationBar)
            
        }
    }
    
    func BoardroomTable() async throws -> RoomModel {
        let endpoint = "https://api.airtable.com/v0/appLz0XN14sqwEYBd/Boardrooms"
        
        guard let url = URL(string: endpoint) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(RoomModel.self, from: data)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
