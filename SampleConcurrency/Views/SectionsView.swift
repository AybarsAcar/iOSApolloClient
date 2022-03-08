//
//  SectionsView.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 4/3/2022.
//

import SwiftUI

struct SectionsView: View {
  
  @EnvironmentObject private var sectionViewModel: SectionViewModel
  @Environment(\.isSearching) private var isSearching
  
    var body: some View {
      VStack {
        if isSearching {
          if sectionViewModel.filteredSections.count > 0 {
            // display filtered sections
            List(sectionViewModel.filteredSections) { section in
              Text(section.title)
            }
          }
          else {
            List(0..<1 ) { section in
              Text("No results")
            }
          }
        }
        else {
          SectionList()
        }
      }
      .navigationTitle("All Sections")
      .padding(.bottom, 100)
    }
}

struct SectionsView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationView {
        SectionsView()
      }
      .environmentObject(SectionViewModel())
    }
}
