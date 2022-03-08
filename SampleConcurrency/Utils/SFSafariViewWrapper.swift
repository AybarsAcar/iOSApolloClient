//
//  SFSafariViewWrapper.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 7/3/2022.
//

import SwiftUI
import SafariServices

/// wrapper to display a safari browser in the application
struct SFSafariViewWrapper: UIViewControllerRepresentable {
  
  let url: URL
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
    return SFSafariViewController(url: url)
  }
  
  func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
    return
  }
}
