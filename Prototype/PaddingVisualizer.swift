//
//  PaddingVisualizer.swift
//  Prototype
//
//  Created by 김동현 on 12/7/24.
//

import SwiftUI

struct RecursivePaddingVisualizer: ViewModifier {
    var padding: EdgeInsets
    var backgroundColor: Color
    var borderColor: Color
    var showLabels: Bool // 텍스트 표시 여부를 제어하는 Bool 값

    func body(content: Content) -> some View {
        content
            .padding(padding) // 방향별 패딩 적용
            .background(backgroundColor.opacity(0.3)) // 패딩 영역 시각화
            .border(borderColor, width: 2) // 경계선 표시
            .overlay(
                VStack(spacing: 0) {
                    if showLabels, padding.top > 0 {
                        Text("top: \(Int(padding.top))")
                            .font(.caption)
                            .foregroundColor(.primary)
                            .offset(y: -padding.top / 2 - 10)
                    }
                    Spacer()
                    HStack {
                        if showLabels, padding.leading > 0 {
                            Text("leading: \(Int(padding.leading))")
                                .font(.caption)
                                .foregroundColor(.primary)
                                .offset(x: -padding.leading / 2 - 20)
                        }
                        Spacer()
                        if showLabels, padding.trailing > 0 {
                            Text("trailing: \(Int(padding.trailing))")
                                .font(.caption)
                                .foregroundColor(.primary)
                                .offset(x: padding.trailing / 2 + 20)
                        }
                    }
                    Spacer()
                    if showLabels, padding.bottom > 0 {
                        Text("bottom: \(Int(padding.bottom))")
                            .font(.caption)
                            .foregroundColor(.primary)
                            .offset(y: padding.bottom / 2 + 10)
                    }
                }
            )
    }
}

extension View {
    func visualizePadding(
        top: CGFloat = 0,
        leading: CGFloat = 0,
        bottom: CGFloat = 0,
        trailing: CGFloat = 0,
        backgroundColor: Color = .yellow,
        borderColor: Color = .red,
        showLabels: Bool = true // 기본값으로 텍스트 표시
    ) -> some View {
        self.modifier(RecursivePaddingVisualizer(
            padding: EdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing),
            backgroundColor: backgroundColor,
            borderColor: borderColor,
            showLabels: showLabels
        ))
    }
}

struct PaddingView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .visualizePadding(top: 10, leading: 5, bottom: 15, trailing: 20, backgroundColor: .green, borderColor: .blue, showLabels: false)
            HStack {
                Text("Child 1")
                    .visualizePadding(top: 10, leading: 10, bottom: 10, trailing: 10, backgroundColor: .orange, borderColor: .purple, showLabels: false)

                Text("Child 2")
                    .visualizePadding(top: 15, leading: 5, bottom: 5, trailing: 25, backgroundColor: .pink, borderColor: .black, showLabels: false)
            }
            Text("Goodbye!")
                .visualizePadding(top: 20, leading: 10, bottom: 10, trailing: 10, backgroundColor: .white, borderColor: .red, showLabels: false)
        }
        .visualizePadding(top: 30, leading: 30, bottom: 30, trailing: 30, backgroundColor: .yellow, borderColor: .blue, showLabels: false)
    }
}

struct PaddingView_Previews: PreviewProvider {
    static var previews: some View {
        PaddingView()
            .previewLayout(.sizeThatFits)
    }
}



//import SwiftUI
//
//struct RecursivePaddingVisualizer: ViewModifier {
//    var paddingValue: CGFloat
//    var backgroundColor: Color
//    var borderColor: Color
//
//    func body(content: Content) -> some View {
//        content
//            .padding(paddingValue) // 패딩 적용
//            .background(backgroundColor.opacity(0.3)) // 패딩 영역 시각화
//            .border(borderColor, width: 2) // 경계선 표시
//            .overlay(
//                VStack {
//                    Text("padding: \(Int(paddingValue))") // 패딩 값을 텍스트로 표시
//                        .font(.caption)
//                        .foregroundColor(.black)
//                        //.background(Color.white.opacity(0.7)) // 텍스트 배경
//                        .cornerRadius(5)
//                        //.padding(.top, -paddingValue - 10) // 텍스트 위치 조정
//                        .offset(y: -20) // 고정된 간격으로 위치 조정
//
//                    Spacer()
//                }
//            )
//    }
//}
//
//extension View {
//    func visualizePadding(
//        _ paddingValue: CGFloat = 10,
//        backgroundColor: Color = .yellow,
//        borderColor: Color = .red
//    ) -> some View {
//        self.modifier(RecursivePaddingVisualizer(
//            paddingValue: paddingValue,
//            backgroundColor: backgroundColor,
//            borderColor: borderColor
//        ))
//    }
//}
//
//struct TestView: View {
//    var body: some View {
//        VStack {
//            Text("Hello, World!")
//                .visualizePadding(10, backgroundColor: .green, borderColor: .blue)
//            HStack {
//                Text("Child 1")
//                    .visualizePadding(15, backgroundColor: .orange, borderColor: .purple)
//
//                Text("Child 2")
//                    .visualizePadding(20, backgroundColor: .pink, borderColor: .black)
//            }
//            Text("Goodbye!")
//                .visualizePadding(25, backgroundColor: .gray, borderColor: .red)
//        }
//        .visualizePadding(30, backgroundColor: .yellow, borderColor: .blue) // VStack 자체에 패딩 적용
//    }
//}
//
//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//            .previewLayout(.sizeThatFits)
//    }
//}
//
//import SwiftUI
//
//struct RecursivePaddingVisualizer: ViewModifier {
//    var padding: EdgeInsets
//    var backgroundColor: Color
//    var borderColor: Color
//
//    func body(content: Content) -> some View {
//        content
//            .padding(padding) // 방향별 패딩 적용
//            .background(backgroundColor.opacity(0.3)) // 패딩 영역 시각화
//            .border(borderColor, width: 2) // 경계선 표시
//            .overlay(
//                ZStack {
//                    if padding.top > 0 {
//                        Text("top: \(Int(padding.top))")
//                            .font(.caption)
//                            .foregroundColor(.black)
//                            .offset(y: -35) // 테두리 위 고정 간격
//                    }
//                    if padding.leading > 0 {
//                        Text("leading: \(Int(padding.leading))")
//                            .font(.caption)
//                            .foregroundColor(.black)
//                            .offset(x: -80) // 테두리 왼쪽 고정 간격
//                    }
//                    if padding.trailing > 0 {
//                        Text("trailing: \(Int(padding.trailing))")
//                            .font(.caption)
//                            .foregroundColor(.black)
//                            .offset(x: 70) // 테두리 오른쪽 고정 간격
//                    }
//                    if padding.bottom > 0 {
//                        Text("bottom: \(Int(padding.bottom))")
//                            .font(.caption)
//                            .foregroundColor(.black)
//                            .offset(y: 75) // 테두리 아래 고정 간격
//                    }
//                }
//            )
//    }
//}
//
//extension View {
//    func visualizePadding(
//        top: CGFloat = 0,
//        leading: CGFloat = 0,
//        bottom: CGFloat = 0,
//        trailing: CGFloat = 0,
//        backgroundColor: Color = .yellow,
//        borderColor: Color = .red
//    ) -> some View {
//        self.modifier(RecursivePaddingVisualizer(
//            padding: EdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing),
//            backgroundColor: backgroundColor,
//            borderColor: borderColor
//        ))
//    }
//}
//
//struct TestView: View {
//    var body: some View {
//        VStack {
//            Text("Hello, World!")
//                .visualizePadding(top: 10, leading: 5, bottom: 15, trailing: 20, backgroundColor: .green, borderColor: .blue)
//            HStack {
//                Text("Child 1")
//                    .visualizePadding(top: 10, leading: 10, bottom: 10, trailing: 10, backgroundColor: .orange, borderColor: .purple)
//                Text("Child 2")
//                    .visualizePadding(top: 15, leading: 5, bottom: 5, trailing: 25, backgroundColor: .pink, borderColor: .black)
//            }
//            Text("Goodbye!")
//                .visualizePadding(top: 20, leading: 10, bottom: 10, trailing: 10, backgroundColor: .gray, borderColor: .red)
//        }
//        .visualizePadding(top: 30, leading: 30, bottom: 30, trailing: 30, backgroundColor: .yellow, borderColor: .blue)
//    }
//}
//
//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//            .previewLayout(.sizeThatFits)
//    }
//}




//
//
//import SwiftUI
//
//struct RecursivePaddingVisualizer: ViewModifier {
//    var padding: EdgeInsets
//    var backgroundColor: Color
//    var borderColor: Color
//
//    func body(content: Content) -> some View {
//        content
//            .padding(padding) // 방향별 패딩 적용
//            .background(backgroundColor.opacity(0.3)) // 패딩 영역 시각화
//            .border(borderColor, width: 2) // 경계선 표시
//            .overlay(
//                VStack(spacing: 0) {
//                    if padding.top > 0 {
//                        Text("top: \(Int(padding.top))")
//                            .font(.caption)
//                            .foregroundColor(.primary)
//                            .offset(y: -padding.top / 2 - 10)
//                    }
//                    Spacer()
//                    HStack {
//                        if padding.leading > 0 {
//                            Text("leading: \(Int(padding.leading))")
//                                .font(.caption)
//                                .foregroundColor(.primary)
//                                .offset(x: -padding.leading / 2 - 20)
//                        }
//                        Spacer()
//                        if padding.trailing > 0 {
//                            Text("trailing: \(Int(padding.trailing))")
//                                .font(.caption)
//                                .foregroundColor(.primary)
//                                .offset(x: padding.trailing / 2 + 20)
//                        }
//                    }
//                    Spacer()
//                    if padding.bottom > 0 {
//                        Text("bottom: \(Int(padding.bottom))")
//                            .font(.caption)
//                            .foregroundColor(.primary)
//                            .offset(y: padding.bottom / 2 + 10)
//                    }
//                }
//            )
//    }
//}
//
//extension View {
//    func visualizePadding(
//        top: CGFloat = 0,
//        leading: CGFloat = 0,
//        bottom: CGFloat = 0,
//        trailing: CGFloat = 0,
//        backgroundColor: Color = .yellow,
//        borderColor: Color = .red
//    ) -> some View {
//        self.modifier(RecursivePaddingVisualizer(
//            padding: EdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing),
//            backgroundColor: backgroundColor,
//            borderColor: borderColor
//        ))
//    }
//}
//
//struct TestView: View {
//    var body: some View {
//        VStack {
//            Text("Hello, World!")
//                .visualizePadding(top: 10, leading: 5, bottom: 15, trailing: 20, backgroundColor: .green, borderColor: .blue)
//            HStack {
//                Text("Child 1")
//                    .visualizePadding(top: 10, leading: 10, bottom: 10, trailing: 10, backgroundColor: .orange, borderColor: .purple)
//
//                Text("Child 2")
//                    .visualizePadding(top: 15, leading: 5, bottom: 5, trailing: 25, backgroundColor: .pink, borderColor: .black)
//            }
//            Text("Goodbye!")
//                .visualizePadding(top: 20, leading: 10, bottom: 10, trailing: 10, backgroundColor: .gray, borderColor: .red)
//        }
//        .visualizePadding(top: 30, leading: 30, bottom: 30, trailing: 30, backgroundColor: .yellow, borderColor: .blue)
//    }
//}
//
//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//            .previewLayout(.sizeThatFits)
//    }
//}
