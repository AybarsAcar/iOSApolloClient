//
//  ModalManager.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 7/3/2022.
//

import Foundation

final class ModalManager: ObservableObject {
  
  enum Modal {
    case signIn, signUp, resetPassword
  }
  
  @Published var showModal: Bool = false
  @Published var activeModal: Modal = .signIn
}
