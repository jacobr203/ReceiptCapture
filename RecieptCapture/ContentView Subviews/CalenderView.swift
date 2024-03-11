//
//  CalenderView.swift
//  RecieptCapture
//
//  Created by jacob rego on 3/10/24.
//

import SwiftUI


struct CalenderView: View {
    private let calendar = Calendar.current
    @State private var currentDate = Date()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(daysInCurrentMonth(), id: \.self) { day in
                    HStack{
                        Text("\(self.calendar.component(.day, from: day))")
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(self.isToday(day) ? Color.blue : Color.clear)
                            .foregroundColor(self.isToday(day) ? .white : .primary)
                            .cornerRadius(10)
                        //Need to add day here.
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                //receipt filing
                                Text("Category 1")
                                Text("Category 2")
                                Text("Category 3")
                                Text("Category 4")
                                Text("Category 5")
                                Text("Category 6")
                                Text("Category 7")
                                Text("Category 8")
                                Text("Category 9")
                                
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(width: 400, height: 650, alignment: .leading)
    }
    
    // Function to get an array of dates for the current month
    private func daysInCurrentMonth() -> [Date] {
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: calendar.startOfDay(for: currentDate)))!
        let range = calendar.range(of: .day, in: .month, for: startOfMonth)!
        let days = range.map { calendar.date(byAdding: .day, value: $0 - 1, to: startOfMonth)! }
        return days
    }
    
    // Function to check if a date is today
    private func isToday(_ date: Date) -> Bool {
        return calendar.isDate(date, inSameDayAs: Date())
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}
