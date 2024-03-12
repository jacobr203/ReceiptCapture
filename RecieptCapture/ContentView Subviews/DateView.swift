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
//    @Binding var isSidebarVisible: Bool
        
    var body: some View {
            HStack {
                Button(action: {
//                    self.isSidebarVisible.toggle()
                }) {
                    Image(systemName: strMenuIconName)
                        .accentColor(.white)
                        .frame(width:40, height: 30)
                        .padding(.leading, 30)
                        .font(.system(size: 20))
                }
                Spacer()
                Button(action: {
                    dtmMonth = addMonth(forward: false)
                }) {
                    Image(systemName: strLeftArrow)
                        .accentColor(.white)
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
                        .accentColor(.white)
                        .frame(width:40, height: 30)
                        .font(.system(size: 20))
                }
                Spacer()
                Button(action: {
                    // Button action code to open model
                }) {
                    Image(systemName: strManualReciept)
                        .accentColor(.white)
                        .frame(width:40, height: 30)
                        .padding(.trailing, 30)
                        .font(.system(size: 20))
                }
                
            }
            .frame(width: 400, height: 50)
            Spacer()
//        NavigationView {
//            Sidebar(isSidebarVisible: $isSidebarVisible)
//        }
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

//struct Sidebar: View {
//    @Binding var isSidebarVisible: Bool
//    
//    var body: some View {
//        
//        VStack {
//            NavigationLink(destination: Text("First Sidebar Item")) {
//
//                Image(systemName: "gear")
//                    .foregroundColor(.white)
//                    .padding(.trailing, 33)
//            }
//            // Add more sidebar items as needed
//        }
//        .listStyle(SidebarListStyle())
//        .navigationTitle("Sidebar")
//        .navigationBarHidden(!isSidebarVisible)
//        .frame(width: 180, height: 600, alignment: .topTrailing)
//        .background(Color.gray)
//        .shadow(color: Color.black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//    }
//    
//}
//
//#Preview {
//
//    DateView(isSidebarVisible: $issideBar)
//}
