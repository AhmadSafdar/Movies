//
//  ErrorView.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import Foundation

import SwiftUI

struct ErrorView: View {
    
    let error: ServiceError
    
    var body: some View {
        VStack {
            Text("Something went wrong")
                .h1TitleStyle()
            Text(error.localizedDescription)
                .descriptionStyle()
        }
    }
}
