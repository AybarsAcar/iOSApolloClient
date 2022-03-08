//
//  SectionView.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 8/3/2022.
//

import SwiftUI

struct SectionView: View {
  
  @Environment(\.presentationMode) private var presentationMode
  
  let course: Course
  let section: SectionsCollection.Section
  
  var body: some View {
    ZStack(alignment: .top) {
      content
      
      HStack {
        Button(action: {
          presentationMode.wrappedValue.dismiss()
        }) {
          CloseButton()
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
extension SectionView {
  
  var content: some View {
    ScrollView {
      SectionViewCover(course: course, section: section)
      
      Text(section.content)
        .padding(16)
    }
    .ignoresSafeArea()
  }
}

struct SectionView_Previews: PreviewProvider {
  static var previews: some View {
    SectionView(course: coursePreviewData, section: coursePreviewData.sectionCollection!.sections.first!)
  }
}
