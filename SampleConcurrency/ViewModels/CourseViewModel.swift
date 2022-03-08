//
//  CourseViewModel.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 1/3/2022.
//

import Foundation
import Apollo

enum FeaturedSubject: String, CaseIterable {
  case SwiftUI = "SwiftUI"
  case Design = "Design"
}

final class CourseViewModel: ObservableObject {
  
  @Published private(set) var courses: [Course] = []
  @Published private(set) var featuredCourses: [Course] = []
  
  private(set) var featuredSubject: FeaturedSubject = FeaturedSubject.allCases.randomElement() ?? .SwiftUI
  
  @MainActor
  func fetch() async {
    do {
      let result = try await queryCourses()
      if let result = result,
         let courseCollection = result.data?.courseCollection {
        
        courses = process(data: courseCollection)
        findFeaturedCourses()
      }
      
    } catch {
      
    }
  }
  
  private func findFeaturedCourses() {
    guard courses.count > 0 else { return }
    
    featuredCourses = courses.filter({ $0.subject == featuredSubject.rawValue })
  }
  
  private func queryCourses() async throws -> GraphQLResult<CourseQuery.Data>? {
    
    return await withCheckedContinuation { continuation in
      Network.shared.apollo.fetch(query: CourseQuery()) { result in
        
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
  
  private func process(data: CoursesData) -> [Course] {
    let content = CoursesCollection.init(data)
    return content.courses
  }
}
