//
//  Item.swift
//  Boardroom App
//
//  Created by Sara AlQuwaifli on 14/02/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
