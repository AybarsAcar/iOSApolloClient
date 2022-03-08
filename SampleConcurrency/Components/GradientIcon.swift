//
//  GradientIcon.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 7/3/2022.
//

import SwiftUI

struct GradientIcon: View {
  var icon: String = "envelope.fill"
  var gradient: Array<Color> = [
    Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)),
    Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)),
    Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)),
  ]
  
  var body: some View {
    ZStack {
      Image(systemName: icon)
        .frame(width: 36, height: 36)
        .background(.linearGradient(colors: gradient, startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .cornerRadius(12)
    }
  }
}

struct GradientIcon_Previews: PreviewProvider {
  static var previews: some View {
    GradientIcon()
      .previewLayout(.sizeThatFits)
  }
}
