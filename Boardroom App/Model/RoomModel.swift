
import Foundation
//
//struct RoomModel: Hashable, Identifiable, Decodable {
//    let id : String
//    let name: String
//    let facilities: [String]
//    let floor_no: Int
//    let no_of_seats: Int
//    let description: String
//    let image_url: String
//}


// MARK: - Welcome
struct RoomModel2: Codable {
    let records: [RoomModel]
}

// MARK: - Record
struct RoomModel: Codable, Identifiable {
    let id, createdTime: String
    let fields: Fields
}

// MARK: - Fields
struct Fields: Codable {
    let imageURL: String
    let noOfSeats, floorNo: Int
    let description: String
    let facilities: [String]
    let id, name: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case noOfSeats = "no_of_seats"
        case floorNo = "floor_no"
        case description, facilities, id, name
    }
}
