//
//  SectionList.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 4/3/2022.
//

import SwiftUI

struct SectionList: View {
  
  @EnvironmentObject private var viewModel: SectionViewModel
  
  var body: some View {
    List {
      ForEach($viewModel.sections) { $item in
        HStack {
          Text(item.title)
          
          Spacer()
          
          if item.isPinned {
            Image(systemName: "pin.fill")
              .foregroundColor(.green)
          }
        }
        .swipeActions {
          Button {
            item.isPinned.toggle()
            viewModel.orderSectionsByPinned()
          } label: {
            if item.isPinned {
              Label("Unpin", systemImage: "pin.slash")
            }
            else {
              Label("Pin", systemImage: "pin")
            }
          }
          .tint(item.isPinned ? .yellow : .green)
        }
      }
    }
    .refreshable {
      await viewModel.randomizeSections()
    }
    .task {
      await viewModel.fetch()
    }
  }
}

struct SectionList_Previews: PreviewProvider {
  static var previews: some View {
    SectionList()
      .environmentObject(SectionViewModel())
  }
}
