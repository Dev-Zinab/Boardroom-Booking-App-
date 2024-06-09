////
////  CalendarModel.swift
////  Boardroom App
////
////  Created by Sara AlQuwaifli on 24/02/2024.
////
//
//
//import Foundation
//
////class DayViewModel: ObservableObject {
////    @Published var date: Date
////    @Published var selectedDate: Date
////
////    init(date: Date, selectedDate: Date) {
////        self.date = date
////        self.selectedDate = selectedDate
////    }
////
////    func dayName() -> String {
////        let dateFormatter = DateFormatter()
////        dateFormatter.dateFormat = "E"
////        return dateFormatter.string(from: date)
////    }
////
////    func dayNumber() -> String {
////        let calendar = Calendar.current
////        let day = calendar.component(.day, from: date)
////        return "\(day)"
////    }
////    
////}
//// DayViewModel.swift
////import SwiftUI
////
////class DayViewModel: ObservableObject {
////    @Published var selectedDate: Date
////    @Published var date: Date
////
////    init(date: Date, selectedDate: Date) {
////        self.date = date
////        self.selectedDate = selectedDate
////    }
////}
//// DayViewModel.swift
//import SwiftUI
//import Combine
//
//class DayViewModel: ObservableObject {
//    @Published var date: Date
//    @Published var selectedDate: Date
//
//    init(date: Date, selectedDate: Date) {
//        self.date = date
//        self.selectedDate = selectedDate
//    }
//
//    func dayName() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "E" // E represents the day of the week
//        return dateFormatter.string(from: date)
//    }
//
//    func dayNumber() -> String {
//        let calendar = Calendar.current
//        let day = calendar.component(.day, from: date)
//        return "\(day)"
//    }
//
//    func updateSelectedDate(to newDate: Date) {
//        selectedDate = newDate
//    }
//}
