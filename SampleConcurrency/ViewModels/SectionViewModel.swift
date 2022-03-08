//
//  SectionViewModel.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 4/3/2022.
//

import Foundation
import Apollo

final class SectionViewModel: ObservableObject {
  
  @Published var sections: [SectionsDataCollection.Section] = []
  @Published private(set) var filteredSections: [SectionsDataCollection.Section] = []
  
  @MainActor
  func fetch() async {
    do {
      let result = try await querySections()
      if let result = result,
         let sectionCollection = result.data?.sectionCollection {
        
        sections = process(data: sectionCollection)
      }
      
    } catch {
      print("Error", error)
    }
  }
  
  func randomizeSections() async {
    sections.shuffle()
  }
  
  func orderSectionsByPinned() {
    sections.sort { $0.isPinned && !$1.isPinned }
  }
  
  func filterSections(for text: String) {
    // reset the filtered sections
    filteredSections = []
    
    let searchText = text.lowercased()
    
    sections.forEach { section in
      let searchContent = section.title
      
      if searchContent.lowercased().range(of: searchText, options: .regularExpression) != nil {
        filteredSections.append(section)
      }
    }
  }
  
  private func querySections() async throws -> GraphQLResult<SectionQuery.Data>? {
    
    return await withCheckedContinuation { continuation in
      Network.shared.apollo.fetch(query: SectionQuery()) { result in
        
        switch result {
        case .success(let graphQLResult):
          continuation.resume(returning: graphQLResult)
          
        case .failure(let error):
          if let error = error as? Never {
            continuation.resume(throwing: error)
          }
        }
      }
    }
  }
  
  private func process(data: SectionsCollectionData) -> [SectionsDataCollection.Section] {
    let content = SectionsDataCollection.init(data)
    return content.sections
  }
}
