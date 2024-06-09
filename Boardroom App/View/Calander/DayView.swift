////
////  SwiftUIView.swift
////  Boardroom App
////
////  Created by Zinab Zooba on 20/08/1445 AH.
////
//
//import SwiftUI
//
//extension Date {
//    func isInSameDayAs(_ date: Date) -> Bool {
//        return Calendar.current.isDate(self, inSameDayAs: date)
//    }
//}
//
//
//
//import SwiftUI
//
//
////struct DayView: View {
////    @ObservedObject var viewModel: DayViewModel
////
////    var body: some View {
////        VStack {
////            Text(dayName(from: viewModel.date))
////                .font(.caption)
////
////            VStack {
////                Text(dayNumber(from: viewModel.date))
////                    .font(.headline)
////            }
////            .frame(width: 50, height: 50)
////            .background(viewModel.selectedDate.isInSameDayAs(viewModel.date) ? Color.orange : Color.gray)
////            .cornerRadius(80)
////            .onTapGesture {
////                viewModel.selectedDate = viewModel.date
////            }
////        }
////    }
////
////    private func dayName(from date: Date) -> String {
////        let dateFormatter = DateFormatter()
////        dateFormatter.dateFormat = "E"
////        return dateFormatter.string(from: date)
////    }
////
////    private func dayNumber(from date: Date) -> String {
////        let calendar = Calendar.current
////        let day = calendar.component(.day, from: date)
////        return "\(day)"
////    }
////}
//// DayView.swift
//import SwiftUI
//
//struct DayView: View {
//    @ObservedObject var viewModel: DayViewModel
//
//    var body: some View {
//        VStack {
//            Text(viewModel.dayName())
//                .font(.caption)
//
//            VStack {
//                Text(viewModel.dayNumber())
//                    .font(.headline)
//            }
//            .frame(width: 50, height: 50)
//            .background(viewModel.selectedDate.isInSameDayAs(viewModel.date) ? Color.orange : Color.gray)
//            .cornerRadius(80)
//            .onTapGesture {
//                viewModel.updateSelectedDate(to: viewModel.date)
//            }
//        }
//    }
//}
