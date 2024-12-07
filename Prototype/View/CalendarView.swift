//
//  Calendar.swift
//  Prototype
//
//  Created by 김동현 on 12/6/24.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()
        
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Text("선택한 날짜: \(selectedDate, formatter: dateFormatter)")
                        //.padding()
                        .visualizePadding(top: 10, leading: 10, bottom: 10, trailing: 10, backgroundColor: .yellow, borderColor: .blue, showLabels: true)
                        .padding(.top, 50)
                        .padding(.bottom, 50)
                    
                    Spacer()
                    
                    DatePicker(
                        "Start Date",
                        selection: $selectedDate,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .padding()
                    .environment(\.locale, Locale(identifier: "ko_KR"))
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.5)
                    .clipped()
                    .frame(maxWidth: .infinity) // 부모 VStack 내에서 중앙 정렬
                    .visualizePadding(top: 10, bottom: 40,backgroundColor: .yellow, borderColor: .blue)
                    //Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .center) // GeometryReader 내에서 중앙 정렬
            }
            
        }

    }
    
    // 날짜 형식을 지정하기 위한 Formatter
   private var dateFormatter: DateFormatter {
       let formatter = DateFormatter()
       formatter.dateStyle = .medium
       return formatter
   }
}

#Preview {
    CalendarView()
}
