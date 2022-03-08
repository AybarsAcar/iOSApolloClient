//
//  AccountView.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 7/3/2022.
//

import SwiftUI

struct AccountView: View {
  
  @StateObject private var accountViewModel = AccountViewModel()
  
  @State private var user: User?
  
  var body: some View {
    VStack{
      if let user = user {
        ProfileCard(user: user)
          .padding(.horizontal, 8)
      }
      else {
        Text("No user found")
      }
    }
    .task {
      do {
        user = try await accountViewModel.getUser()
      } catch {
        print(error)
      }
    }
  }
}

struct AccountView_Previews: PreviewProvider {
  static var previews: some View {
    AccountView()
  }
}
