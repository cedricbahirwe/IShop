//
//  MainViewModel.swift
//  Ishop
//
//  Created by Cédric Bahirwe on 01/05/2021.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var showNotificationApprovalView: Bool = false
    @Published var showLocationApprovalView: Bool = false
}
