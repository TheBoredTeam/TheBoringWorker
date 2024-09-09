# TheBoringWorker Documentation

## Overview

`TheBoringWorker` is a Swift-based macOS application designed to interface with the `boring.notch` service. It communicates using macOS Distributed Notification Center to send and receive notifications. `TheBoringWorker` sends data and notifications to `boring.notch`, which handles UI integration.

## Features

- **Send Data**: Transmits data to `boring.notch`.
- **Receive Notifications**: Listens for notifications from `boring.notch`.
- **Immediate Notifications**: Supports sending notifications with an "immediate" flag.

## Prerequisites

- macOS 10.14 or later
- Xcode 12 or later

## Installation

1. **Clone the Repository**

   ```sh
   git clone https://github.com/TheBoredTeam/TheBoringWorker.git
   cd TheBoringWorker
   ```

2. **Open the Project**

   Open the `TheBoringWorker.xcodeproj` file in Xcode:

   ```sh
   open TheBoringWorker.xcodeproj
   ```

3. **Build and Run**

   Build and run the project in Xcode. Ensure all necessary permissions are granted for notifications and inter-process communication.

## Sending Notifications

To send a notification to `boring.notch`, use the following Swift code snippet:

```swift
import Foundation
import Cocoa

func sendNotification(withData data: [String: Any], immediate: Bool = false) {
    let notificationCenter = NSDistributedNotificationCenter.default
    let notificationName = "com.theboredteam.boring.notch.notification"

    var userInfo = data

    notificationCenter.postNotificationName(
        NSNotification.Name(notificationName),
        object: nil,
        userInfo: userInfo,
        deliverImmediately: immediate
    )
}
```

### Example Usage

```swift
let dataToSend = [
    "message": "Hello from TheBoringWorker",
    "timestamp": Date().description
]

sendNotification(withData: dataToSend, immediate: true)
```

## Receiving Notifications

To receive notifications from `boring.notch`, use the following Swift code snippet:

```swift
import Foundation
import Cocoa

class NotificationReceiver {
    private let notificationCenter = NSDistributedNotificationCenter.default
    private let notificationName = "com.theboredteam.boring.notch.notification"

    init() {
        notificationCenter.addObserver(
            self,
            selector: #selector(handleNotification(_:)),
            name: NSNotification.Name(notificationName),
            object: nil
        )
    }

    @objc private func handleNotification(_ notification: NSNotification) {
        if let userInfo = notification.userInfo as? [String: Any] {
            print("Received notification with data: \(userInfo)")
            // Handle the received notification data
        }
    }

    deinit {
        notificationCenter.removeObserver(self)
    }
}
```

### Example Usage

```swift
let receiver = NotificationReceiver()
// Notifications will be handled by the `handleNotification` method
```

## UI Integration

The user interface for `TheBoringWorker` is integrated within `boring.notch`. `TheBoringWorker` focuses on backend operations and notification handling, while `boring.notch` handles the user interface components.

For details on integrating `TheBoringWorker` with `boring.notch`, please refer to the [boring.notch documentation](https://github.com/TheBoredTeam/boring.notch).

## Contributing

1. **Fork the Repository**
2. **Create a Feature Branch**
3. **Commit Your Changes**
4. **Push to the Branch**
5. **Open a Pull Request**

For more details, please refer to our [contributing guidelines](CONTRIBUTING.md).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any issues or questions, please open an issue on [GitHub](https://github.com/TheBoredTeam/TheBoringWorker/issues).