////
////  SwiftUIView.swift
////  Boardroom App
////
////  Created by Zinab Zooba on 20/08/1445 AH.
////
//
//import Foundation
//
//class NumberOfDaysPickerViewModel: ObservableObject {
//    @Published var selectedDate = Date()
//    private let numberOfDaysToShow = 14
//
//    var daysToShow: [Date] {
//        let calendar = Calendar.current
//        let startOfDay = calendar.startOfDay(for: selectedDate)
//
//        let startOfDisplayRange = calendar.date(byAdding: .day, value: -numberOfDaysToShow / 2, to: startOfDay)!
//        let maximumStartDate = calendar.startOfDay(for: Date())
//
//        return (0..<numberOfDaysToShow).compactMap { dayOffset in
//            let date = calendar.date(byAdding: .day, value: dayOffset, to: startOfDisplayRange)!
//            return date >= maximumStartDate ? date : nil
//        }
//    }
//}

import SwiftUI

struct NumberOfDaysPicker: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(spacing:1) {
            Text("All Booking for \(selectedDate.monthName())")
                .bold()
                .padding(.trailing, 180)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(daysToShow(), id: \.self) { date in
                        DayView(date: date, selectedDate: $selectedDate)
                    }
                }
                .padding()
            }
        }
    }
    
    private var numberOfDaysToShow: Int {
        // تعديل عدد الأيام المراد عرضها
        return 14
    }
    
    private func daysToShow() -> [Date] {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: selectedDate)
        
        // حساب تاريخ البداية للأيام المعروضة
        let startOfDisplayRange = calendar.date(byAdding: .day, value: -numberOfDaysToShow / 2, to: startOfDay)!
        
        // حد أقصى للرجوع هو تاريخ اليوم الحالي
        let maximumStartDate = calendar.startOfDay(for: Date())
        
        return (0..<numberOfDaysToShow).compactMap { dayOffset in
            let date = calendar.date(byAdding: .day, value: dayOffset, to: startOfDisplayRange)!
            return date >= maximumStartDate ? date : nil
        }
    }
}

struct DayView: View {
    let date: Date
    @Binding var selectedDate: Date
    
    var body: some View {
        VStack {
            Text(dayName(from: date))
                .font(.caption)
                .foregroundStyle(.gray)
            
            VStack {
                Text("\(dayNumber(from: date))")
                    .font(.headline)
            }
            .frame(width: 40, height: 40)
            .background(selectedDate.isInSameDayAs(date) ? Color("Orange") : Color.white)
            .foregroundStyle(selectedDate.isInSameDayAs(date) ? Color.white : Color.black)
            .cornerRadius(80)
            .onTapGesture {
                selectedDate = date
            }
        }
    }
    
    private func dayName(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E" // E يُمثل اسم اليوم في الأسبوع
        return dateFormatter.string(from: date)
    }
    
    private func dayNumber(from date: Date) -> String {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        return "\(day)"
    }
}

extension Date {
    func isInSameDayAs(_ date: Date) -> Bool {
        return Calendar.current.isDate(self, inSameDayAs: date)
    }
    
    func monthName() -> String {
        let calendar = Calendar.current
        let monthSymbols = calendar.monthSymbols
        let month = calendar.component(.month, from: self)
        let currentMonthName = monthSymbols[month - 1]
        return "\(currentMonthName)"
    }
}

struct NumberOfDaysPicker_Previews: PreviewProvider {
    static var previews: some View {
        NumberOfDaysPicker()
    }
}
