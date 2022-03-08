//
//  FeaturedCourseList.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 1/3/2022.
//

import SwiftUI

struct FeaturedCourseList: View {
  
  let featuredCourses: [Course]
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 20) {
        if featuredCourses.count <= 0 {
          ForEach(0 ..< 4) { item in
            FeaturedCourseCard(course: coursePreviewData)
              .redacted(reason: .placeholder)
          }
        }
        else {
          ForEach(featuredCourses) { item in
            NavigationLink(destination: CourseView(course: item)) {
              FeaturedCourseCard(course: item)
                .frame(width: 252, height: 350)
            }
          }
        }
        
      }
      .padding(.horizontal, 20)
    }
    .edgesIgnoringSafeArea(.all)
  }
}

struct FeaturedCourseList_Previews: PreviewProvider {
  static var previews: some View {
    FeaturedCourseList(featuredCourses: [coursePreviewData])
  }
}
