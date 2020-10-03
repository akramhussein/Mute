# Mute

[![Version](https://img.shields.io/cocoapods/v/Mute.svg?style=flat)](http://cocoapods.org/pods/Mute)
[![License](https://img.shields.io/cocoapods/l/Mute.svg?style=flat)](http://cocoapods.org/pods/Mute)
[![Platform](https://img.shields.io/cocoapods/p/Mute.svg?style=flat)](http://cocoapods.org/pods/Mute)

There is no native iOS API to detect if the mute switch is enabled/disabled on a device.

The general principle to check if the device is muted is to play a short sound and detect the length it took to play.
From this length we can determine if it was muted or not.

This library is effectively a Swift variant of [SoundSwitch](https://github.com/moshegottlieb/SoundSwitch).

Has a default trigger rate of 1 second.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

```Swift
import UIKit
import Mute

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel! {
        didSet {
            self.label.text = "-"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Notify every 2 seconds
        Mute.shared.checkInterval = 2.0

        // Always notify on interval
        Mute.shared.alwaysNotify = true

        // Update label when notification received
        Mute.shared.notify = { [weak self] m in
            self?.label.text = m ? "Muted" : "Not Muted"
        }

        // Stop after 5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            Mute.shared.isPaused = true
        }

        // Re-start after 10 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            Mute.shared.isPaused = false
        }
    }

    // Trigger an ad-hoc check
    @IBAction func checkPressed(_ sender: UIButton) {
        Mute.shared.check()
    }

}
```

## Requirements

## Installation

Mute is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Mute'
```

## Author

Akram Hussein, akramhussein@gmail.com

## License

Mute is available under the MIT license. See the LICENSE file for more info.
