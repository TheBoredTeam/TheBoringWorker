# TheBoringWorker Documentation

![TheBoringWorkerNotifier Build & Test](https://github.com/TheBoredTeam/TheBoringWorker/actions/workflows/cicd.yml/badge.svg)

## Overview

`TheBoringWorker` is a Swift-based macOS application designed to interface with the `boring.notch` service. It communicates using macOS Distributed Notification Center to send and receive notifications. `TheBoringWorker` sends data and notifications to `boring.notch`, which handles UI integration.

## Features

- **Send Data**: Transmits data to `boring.notch`.
- **Receive Notifications**: Listens for notifications from `boring.notch`.
- **Immediate Notifications**: Supports sending notifications with an "deliverImmediately" flag.

## Prerequisites

- macOS 14 or later
- Xcode 15 or later

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

## Initialization

To initialize the notifier, use the following Swift code:

```swift
import TheBoringWorkerNotifier

let notifier = TheBoringWorkerNotifier()
```

## Posting a Notification

To post a notification, use the following Swift code snippet: [See example here](https://github.com/TheBoredTeam/TheBoringWorker/blob/e2915fcadf633acf879b8a882cd05c79a70f2a75/TheBoringWorker/models/BoringViewModel.swift#L30), you can create a method here and this is `vm` can be passed to your helper classes.

```swift
notifier.postNotification(name: "theboringteam.theboringworker.togglemic", userInfo: ["key": "value"])
```

## Setting Up an Observer

To set up an observer for notifications, use the following Swift code:

```swift
notifier.setupObserver(notification: notifier.toggleMicNotification) { notification in
    // Handle the notification
    print("Mic toggle notification received")
}
```

## Available Notifications

- `toggleMicNotification`
- `toggleHudReplacementNotification`
- `showClipboardNotification`
- `sneakPeakNotification`
- `micStatusNotification`

Create your own notifications using `WorkerNotification` struct available with `TheBoringWorkerNotifier`

## How the heck boring.notch will know about the notification

Setup a new observer using `notifier.setupObserver` method here: [Click here](https://github.com/TheBoredTeam/boring.notch/blob/3362f50b9c57b158f73b144581def1a02746b567/boringNotch/models/BoringViewModel.swift#L207)

![80466](https://github.com/user-attachments/assets/833a0450-52dc-41e9-a679-5cc1bd708b1e)

## UI Integration

The user interface for `TheBoringWorker` is integrated within `boring.notch`. `TheBoringWorker` focuses on backend operations and notification handling, while `boring.notch` handles the user interface components.

So new ui elements goes into: [Check this](https://github.com/TheBoredTeam/boring.notch/blob/3362f50b9c57b158f73b144581def1a02746b567/boringNotch/ContentView.swift#L183)

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
