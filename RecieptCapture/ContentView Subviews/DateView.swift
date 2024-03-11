//
//  DateView.swift
//  RecieptCapture
//
//  Created by jacob rego on 3/11/24.
//

import SwiftUI


struct DateView: View {
    let strMenuIconName = "line.3.horizontal"
    let strRightArrow = "arrow.right"
    let strLeftArrow = "arrow.left"
    let strManualReciept = "doc.fill.badge.ellipsis"
    @State var dtmMonth = Date()
    
    var body: some View {
        HStack {
            Button(action: {
                // Button action code to open model
            }) {
                Image(systemName: strMenuIconName)
                    .accentColor(.black)
                    .frame(width:40, height: 30)
                    .padding(.leading, 30)
                    .font(.system(size: 20))
            }
            Spacer()
            Button(action: {
                dtmMonth = addMonth(forward: false)
            }) {
                Image(systemName: strLeftArrow)
                    .accentColor(.black)
                    .frame(width:40, height: 30)
                    .font(.system(size: 20))
            }
            Spacer()
            Text(getMonth())
                .font(.title)
            Spacer()
            Button(action: {
                dtmMonth = addMonth(forward: true)
            }) {
                Image(systemName: strRightArrow)
                    .accentColor(.black)
                    .frame(width:40, height: 30)
                    .font(.system(size: 20))
            }
            Spacer()
            Button(action: {
                // Button action code to open model
            }) {
                Image(systemName: strManualReciept)
                    .accentColor(.black)
                    .frame(width:40, height: 30)
                    .padding(.trailing, 30)
                    .font(.system(size: 20))
            }
            
        }
        .frame(width: 400, height: 50)
        Spacer()
    }
    
    private func getMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self.dtmMonth)
    }
    
    //force unwrapping month calc
    func addMonth(forward: Bool) -> Date {
        if forward {
            return Calendar.current.date(byAdding: .month, value: 1, to: self.dtmMonth)!
        } else {
            return Calendar.current.date(byAdding: .month, value: -1, to: self.dtmMonth)!
        }
        
    }
}

#Preview {
    DateView()
}
