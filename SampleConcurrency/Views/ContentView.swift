//
//  ContentView.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 1/3/2022.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject private var courseViewModel: CourseViewModel
  @EnvironmentObject private var sectionViewModel: SectionViewModel
  @StateObject private var modalManager: ModalManager = ModalManager()
  
  @State private var searchText: String = ""
  
  var body: some View {
    ZStack {
      TabView {
        HomeView()
          .environmentObject(modalManager)
          .tabItem {
            Image(systemName: "house")
            Text("Learn now")
          }
        
        
        NavigationView {
          SectionsView()
        }
        .searchable(text: $searchText) {
          ForEach(sectionViewModel.sections.prefix(3)) { section in
            Text(section.title)
              .searchCompletion(section.title)
          }
        }
        .onSubmit(of: .search) {
          sectionViewModel.filterSections(for: searchText)
        }
        .tabItem {
          Image(systemName: "square.stack.3d.down.right.fill")
          Text("Sections")
        }
        
        AccountView()
          .tabItem {
            Image(systemName: "person")
            Text("Account")
          }
      }
      .task {
        await courseViewModel.fetch()
      }
      
      if modalManager.showModal {
        ModalManagerView()
          .environmentObject(modalManager)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(CourseViewModel())
      .environmentObject(SectionViewModel())
  }
}
