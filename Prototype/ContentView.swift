//
//  ContentView.swift
//  Prototype
//
//  Created by 김동현 on 12/6/24.
//

import SwiftUI

struct ContentView: View {
    // @State private var isDark = false
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var showInfoSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section(header: Text("애니메이션")) {
                        NavigationLink(destination: CustomAnimationView(currentTab: 0)) {
                            Text("애니메이션")
                        }
                    }
                    
                    Section(header: Text("리스트 UI")) {
                        NavigationLink(destination: ListDetailView(content: "내용")) {
                            Text("List Detail View")
                        }
                    }
                    
                    Section(header: Text("캘린더")) {
                        NavigationLink(destination: CalendarView()) {
                            Text("기본 캘린더")
                        }
                        
                        NavigationLink(destination: CustomCalendar()) {
                            Text("커스텀 캘린더")
                        }
                    }
                    
                    Section(header: Text("화면 모드")) {
                        Toggle(isOn: $isDarkMode) {
                            HStack {
                                Text("화면 모드")
                                Button {
                                    showInfoSheet.toggle()
                                } label: {
                                    Image(systemName: "info.circle")
                                        .foregroundColor(.primary)
                                }
                                .buttonStyle(BorderlessButtonStyle()) // Toggle과 충돌 방지
                                .sheet(isPresented: $showInfoSheet) {
                                    InfoSheetView()
                                        .presentationDetents([.fraction(0.4), .medium]) // 화면 높이 설정
                                        .presentationDragIndicator(.visible) // 드래그 표시
                                }
                            }
                        }
                    }
                }// list
                .navigationTitle("UI 프로토타입")
            }
            // 다크 모드 적용
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

#Preview {
    ContentView()
}

// 시트에 표시될 뷰
struct InfoSheetView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("화면 모드를 변경하여 앱의 테마를 다크 또는 라이트로 설정할 수 있습니다.")
                .padding()
                .multilineTextAlignment(.center)

            /*
            Button("닫기") {
                // 닫기 동작은 기본적으로 지원됨
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
             */
        }
        .padding()
    }
}
