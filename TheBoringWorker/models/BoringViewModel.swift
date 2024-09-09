//
//  BoringViewModel.swift
//  TheBoringWorker
//
//  Created by Harsh Vardhan  Goswami  on 08/09/24.
//

import Combine
import SwiftUI
import TheBoringWorkerNotifier

class BoringViewModel: NSObject, ObservableObject {
    var cancellables: Set<AnyCancellable> = []
    @Published var releaseName: String = "Glowing Panda 🐼 (Snooty)"
    @AppStorage("showMenuBarIcon") var showMenuBarIcon: Bool = true
    var notifier: TheBoringWorkerNotifier = .init()
    
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
    
    func setupWorkerNotifiers() {
        // you can create a new instance of WorkerNotification if you want to use a different notification
        notifier.setupObserver(notification: WorkerNotification(
            name: "theboringteam.theboringworker.YOUR_NOTIFICATION_NAME",
            handler: { _ in
                print("Received YOUR_NOTIFICATION_NAME notification")
            }
        )) { Notification in
            NSLog("Notification received: \(Notification)")
        }
    }
}
