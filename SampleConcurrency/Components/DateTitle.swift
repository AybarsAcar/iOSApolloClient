//
//  DateTitle.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 1/3/2022.
//

import SwiftUI

struct DateTitle: View {
  
  let title: String
  
  @State private var date: String = ""
  
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(date.uppercased())
        .font(.footnote)
        .fontWeight(.medium)
        .opacity(0.7)
      
      Text(title)
        .font(.largeTitle)
        .bold()
    }
    .onAppear {
      date = Date.now.formatted(.dateTime.weekday(.wide).month().day())
    }
  }
}

struct DateTitle_Previews: PreviewProvider {
  static var previews: some View {
    DateTitle(title: "Learn SwiftUI")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
