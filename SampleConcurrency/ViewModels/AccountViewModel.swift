//
//  AccountViewModel.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 7/3/2022.
//

import SwiftUI

class AccountViewModel: ObservableObject {
  
  func getUser() async throws -> User {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/1") else {
      throw URLError(.badURL)
    }
    
    let request = URLRequest(url: url)
    
    let (data, response) = try await URLSession.shared.data(for: request)
    
    guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw URLError(.badServerResponse) }
    
    let user = try JSONDecoder().decode(User.self, from: data)
    
    return user
  }
}


