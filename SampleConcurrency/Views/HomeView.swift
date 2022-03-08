//
//  HomeView.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 1/3/2022.
//

import SwiftUI

struct HomeView: View {
  
  @EnvironmentObject private var viewModel: CourseViewModel
  @EnvironmentObject private var modalManager: ModalManager
  
  var attrString: AttributedString {
    var subject = AttributedString(viewModel.featuredSubject.rawValue)
    
    var container = AttributeContainer()
    
    if viewModel.featuredCourses.count > 0 {
      container.foregroundColor = Color(hex: viewModel.featuredCourses[0].colors.first!!)
    } else {
      container.foregroundColor = .primary
    }
    
    subject.mergeAttributes(container)
    return "Learn " + subject
  }

  var body: some View {
    ZStack(alignment: .top) {
      ScrollView {
        VStack(spacing: 0) {
          HStack {
            DateTitle(title: attrString)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.top, 20)
            
            Spacer()
            
            ProfileIcon()
              .onTapGesture {
                modalManager.showModal.toggle()
              }
          }
          .padding(.horizontal, 20)
          
          FeaturedCourseList(featuredCourses: viewModel.featuredCourses)
            .padding(.top, 20)
          
          Text("All Courses")
            .font(.title2)
            .fontWeight(.bold)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 50)
          
          CourseList(courses: viewModel.courses)
            .padding(.top, 20)
        }
      }
      
      Color.white
        .animation(.easeIn)
        .ignoresSafeArea()
        .frame(height: 0)
    }
    .navigationBarHidden(true)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
      .environmentObject(CourseViewModel())
      .environmentObject(ModalManager())
  }
}
