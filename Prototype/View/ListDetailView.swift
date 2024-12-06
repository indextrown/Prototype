//
//  ListDetailView.swift
//  Prototype
//
//  Created by 김동현 on 12/6/24.
//

import SwiftUI

struct ListDetailView: View {
    let content: String
    var body: some View {
        Text(content)
    }
}

#Preview {
    ListDetailView(content: .init())
}
