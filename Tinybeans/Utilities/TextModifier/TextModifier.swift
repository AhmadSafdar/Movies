//
//  TextModifier.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import Foundation

import Foundation
import SwiftUI

struct MovieHeaderStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8.0)
            .font(.bold(.custom("Helvetica", size: 12.0))())
            .foregroundColor(.black)
    }
}

struct MovieCardStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8.0)
            .font(.bold(.custom("Helvetica", size: 10.0))())
            .foregroundColor(.black)
    }
}

struct H1TitleStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.bold(.custom("Helvetica", size: 16.0))())
            .multilineTextAlignment(TextAlignment.leading)
            .foregroundColor(.black)
    }
}

struct H2StyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.bold(.custom("Helvetica", size: 14.0))())
            .foregroundColor(.black)
    }
}

struct H3StyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.bold(.custom("Helvetica", size: 12.0))())
            .foregroundColor(.black)
    }
}

struct descriptionStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Helvetica", size: 10.0))
            .foregroundColor(.black)
    }
}
