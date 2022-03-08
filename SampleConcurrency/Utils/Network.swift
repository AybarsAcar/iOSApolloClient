//
//  Network.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 1/3/2022.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()
  
  private let token: String
  private let space: String
  
  private init() {
    token = Bundle.main.object(forInfoDictionaryKey: "TOKEN") as? String ?? ""
    space = Bundle.main.object(forInfoDictionaryKey: "SPACE") as? String ?? ""
  }
  
  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.contentful.com/content/v1/spaces/\(space)?access_token=\(token)")!)
  
}
