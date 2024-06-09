////
////  SwiftUIView.swift
////  Boardroom App
////
////  Created by Zinab Zooba on 20/08/1445 AH.
////
//extension Date {
//    func monthName() -> String {
//        let calendar = Calendar.current
//        let monthSymbols = calendar.monthSymbols
//        let month = calendar.component(.month, from: self)
//        return monthSymbols[month - 1]
//    }
//}
//
//import SwiftUI
//
//// NumberOfDaysPicker.swift
//import SwiftUI
//
//
//// NumberOfDaysPicker.swift
//import SwiftUI
//
//struct NumberOfDaysPicker: View {
//    @StateObject private var viewModel = NumberOfDaysPickerViewModel()
//
//    var body: some View {
//        VStack {
//            Text("All Booking for \(viewModel.selectedDate.monthName())")
//                .font(.title)
//                .padding(.trailing, 110)
//
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 10) {
//                    ForEach(viewModel.daysToShow, id: \.self) { date in
//                        DayView(viewModel: DayViewModel(date: date, selectedDate: viewModel.selectedDate))
//                    }
//                }
//                .padding()
//            }
//        }
//        .environmentObject(viewModel)
//    }
//}
//
//#Preview {
//    NumberOfDaysPicker()
//}
