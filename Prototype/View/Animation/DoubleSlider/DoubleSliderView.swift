//
//  DoubleSliderView.swift
//  Prototype
//
//  Created by 김동현 on 12/8/24.
//

import SwiftUI

struct DoubleSliderView: View {
    var body: some View {
        DoubleSidedBackgroundScrollView(topColor: .black, bottomColor: .white) {
            VStack {
                
            }
        }
        // .navigationBarHidden(true) // 네비게이션 바 숨김
        // .navigationTitle("Custom Detail") 주석해제시 네비게이션 상단바 글자 항상 고정
    }
}

#Preview {
    DoubleSliderView()
}
