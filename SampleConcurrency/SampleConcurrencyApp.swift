//
//  SampleConcurrencyApp.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 1/3/2022.
//

import SwiftUI

@main
struct SampleConcurrencyApp: App {
  
  @StateObject private var courseViewModel = CourseViewModel()
  @StateObject private var sectionViewModel = SectionViewModel()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(courseViewModel)
        .environmentObject(sectionViewModel)
    }
  }
}
