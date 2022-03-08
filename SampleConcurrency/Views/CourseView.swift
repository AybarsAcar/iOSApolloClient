//
//  CourseView.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 8/3/2022.
//

import SwiftUI

struct CourseView: View {
  
  @Environment(\.presentationMode) private var presentationMode
  
  let course: Course
  
  var body: some View {
    ZStack(alignment: .top) {
      content
      
      HStack {
        Button(action: {
          presentationMode.wrappedValue.dismiss()
        }) {
          CloseButton()
            .accessibilityLabel("Back")
            .accessibilityHint("Go back")
        }
        Spacer()
      }
      .padding(.horizontal, 20)
      .padding(.top, 16)
      .frame(maxWidth: .infinity)
      .frame(height: 44)
    }
    .navigationBarHidden(true)
  }
}

// MARK: - Components
extension CourseView {
  
  var content: some View {
    ScrollView {
      CourseViewCover(course: course)
      
      LazyVStack(spacing: 0) {
        ForEach(course.sectionCollection!.sections.indices, id: \.self) { index in
          NavigationLink {
            SectionView(course: course, section: course.sectionCollection!.sections[index])
          } label: {
            SectionRow(section: course.sectionCollection!.sections[index], index: index + 1)
          }
          
        }
      }
      .padding(20)
      .padding(.bottom, 100)
    }
    .ignoresSafeArea()
  }
}

struct CourseView_Preview: PreviewProvider {
  static var previews: some View {
    CourseView(course: coursePreviewData)
  }
}
