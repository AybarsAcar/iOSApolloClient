//
//  GradientButton.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 7/3/2022.
//

import SwiftUI

struct GradientButton: View {
  
  let text: String
  
  private let gradient: Array<Color> = [
    Color(#colorLiteral(red: 0.8446564078, green: 0.5145705342, blue: 1, alpha: 1)),
    Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1))
  ]
  
  var body: some View {
    Text(text)
      .font(.headline)
      .frame(maxWidth: .infinity)
      .frame(height: 50)
      .background(.linearGradient(colors: gradient, startPoint: .top, endPoint: .bottom))
      .cornerRadius(16)
      .foregroundColor(.white)
  }
}

struct GradientButton_Previews: PreviewProvider {
  static var previews: some View {
    GradientButton(text: "Text here")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
