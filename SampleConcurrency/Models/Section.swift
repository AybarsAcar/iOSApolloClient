//
//  Section.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 4/3/2022.
//

import Foundation

typealias SectionsCollectionData = SectionQuery.Data.SectionCollection

struct SectionsDataCollection: Codable {
  let sections: [Section]
  
  init(_ sectionsCollection: SectionsCollectionData?) {
    self.sections = sectionsCollection?.sections.map { section -> Section in
      Section(section)
    } ?? []
  }
  
  struct Section: Codable, Identifiable {
    let id: String
    let title: String
    var isPinned: Bool
    
    init(_ section: SectionQuery.Data.SectionCollection.Section?) {
      self.id = section?.sys.id ?? ""
      self.title = section?.title ?? ""
      self.isPinned = false
    }
  }
}

