//
//  FeaturedCourseCard.swift
//  SampleConcurrency
//
//  Created by Aybars Acar on 1/3/2022.
//

import SwiftUI

struct FeaturedCourseCard: View {
  
  let course: Course
  
  var body: some View {
    VStack(spacing: 8) {
      AsyncImage(url: URL(string: course.illustration)) { image in
        
        image
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(maxWidth: 220, alignment: .center)
        
      } placeholder: {
        Rectangle()
          .foregroundColor(.gray.opacity(0.2))
      }
      
      Text(course.title)
        .font(.title)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .lineLimit(2)
      
      Text("\(course.numberOfSections) sections - \(course.numberOfHours) hours")
        .font(.footnote)
        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7)))
        .frame(maxWidth: .infinity, alignment: .leading)
        .lineLimit(1)
      
      Text(course.subtitle)
        .font(.footnote)
        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7)))
        .frame(maxWidth: .infinity, alignment: .leading)
        .lineLimit(2)
    }
    .padding(16)
    .frame(width: 252, height: 350, alignment: .top)
    .background(
      LinearGradient(
        gradient: Gradient(colors: [.init(hex: course.colors.first!!), .init(hex: course.colors.last!!)]),
        startPoint: .top,
        endPoint: .bottomLeading
      )
    )
    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
    .overlay(
      RoundedRectangle(cornerRadius: 30, style: .continuous)
        .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
        .blendMode(.overlay)
    )
  }
}

struct FeaturedCourseCard_Previews: PreviewProvider {
  static var previews: some View {
    FeaturedCourseCard(course: coursePreviewData)
  }
}
