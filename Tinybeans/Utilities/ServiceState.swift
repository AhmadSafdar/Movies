//
//  ServiceState.swift
//  Tinybeans
//
//  Created by Ahmad Safdar on 3/20/24.
//

import Foundation

@MainActor enum ServiceState {
    case idle
    case loading
    case failed(ServiceError)
    case loaded(Any)
}
