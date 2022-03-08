//
//  CloseButton.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 1/3/2022.
//

import SwiftUI

struct CloseButton: View {
  var size: CGFloat = 32
  var icon = "arrow.left"
  
  var body: some View {
    ZStack {
      Image(systemName: icon)
        .font(.system(size: 15, weight: .bold))
        .foregroundColor(.primary)
        .opacity(0.7)
        .frame(width: size, height: size)
        .background(.ultraThinMaterial)
        .mask(Circle())
        .overlay(
          Circle()
            .stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.3), lineWidth: 1)
        )
    }
  }
  
}

struct CloseButton_Previews: PreviewProvider {
  static var previews: some View {
    CloseButton()
  }
}
