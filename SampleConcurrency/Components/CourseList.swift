//
//  CourseList.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 1/3/2022.
//

import SwiftUI

struct CourseList: View {
  
  let courses: [Course]
  
  var columns = [GridItem(.adaptive(minimum: 160), spacing: 15)]
  
  var body: some View {
    LazyVGrid(columns: columns, spacing: 15) {
      
      if courses.count <= 0 {
        ForEach(0..<4, id: \.self) { number in
          CourseCard(course: coursePreviewData)
            .redacted(reason: .placeholder)
        }
      }
      else {
        ForEach(courses) { item in
          NavigationLink(destination: CourseView(course: item)) {
            CourseCard(course: item)
          }
        }
      }
    }
    .padding(.horizontal, 20)
  }
}

struct CourseList_Previews: PreviewProvider {
  static var previews: some View {
    CourseList(courses: [coursePreviewData])
  }
}
