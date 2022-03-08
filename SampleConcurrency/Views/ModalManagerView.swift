//
//  ModalManagerView.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 7/3/2022.
//

import SwiftUI

struct ModalManagerView: View {
  
  @EnvironmentObject private var modalManager: ModalManager
  
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(.black.opacity(0.5))
        .ignoresSafeArea()
        .onTapGesture {
          modalManager.showModal.toggle()
          modalManager.activeModal = .signIn
        }
      
      switch modalManager.activeModal {
      case .signIn: SignInView()
      case .signUp: SignUpView()
      case .resetPassword: ResetPasswordView()
      }
    }
  }
}

struct ModalManagerView_Previews: PreviewProvider {
  static var previews: some View {
    ModalManagerView()
      .environmentObject(ModalManager())
  }
}
