//
//  ViewExt.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import Foundation
import SwiftUI

extension View {
    func movieHeaderStyle() -> some View {
        self.modifier(MovieHeaderStyleModifier())
    }
    
    func movieCardStyle() -> some View {
        self.modifier(MovieCardStyleModifier())
    }
    
    func h1TitleStyle() -> some View {
        self.modifier(H1TitleStyleModifier())
    }
    
    func h3TitleStyle() -> some View {
        self.modifier(H3StyleModifier())
    }
    
    func descriptionStyle() -> some View {
        self.modifier(descriptionStyleModifier())
    }
}

