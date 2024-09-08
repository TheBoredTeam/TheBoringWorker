//
//  BoringViewModel.swift
//  TheBoringWorker
//
//  Created by Harsh Vardhan  Goswami  on 08/09/24.
//

import Combine
import SwiftUI

class BoringViewModel: NSObject, ObservableObject {
    var cancellables: Set<AnyCancellable> = []
    @Published var releaseName: String = "Glowing Panda 🐼 (Snooty)"
    @AppStorage("showMenuBarIcon") var showMenuBarIcon: Bool = true
    
    deinit {
        destroy()
    }
    
    override init() {
        super.init()
    }
    
    func destroy() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
}
