//
//  ExampleManager.swift
//  TheBoringWorker
//
//  Created by Harsh Vardhan  Goswami  on 09/09/24.
//

import Foundation

class ExampleManager: ObservableObject {
    var vm: BoringViewModel?
    
    init(vm: BoringViewModel) {
        self.vm = vm
    }
    
    func YOUR_FUNCTION_NAME() {
        // Do something
        
        // Throw a event to boring.notch
        
        vm?.notifier.postNotification(name: "YOUR_EVENT_NAME_HERE", userInfo: ["KEY": {}])
    }
}
