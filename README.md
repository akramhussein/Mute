# Mute

[![Version](https://img.shields.io/cocoapods/v/Mute.svg?style=flat)](http://cocoapods.org/pods/Mute)
[![License](https://img.shields.io/cocoapods/l/Mute.svg?style=flat)](http://cocoapods.org/pods/Mute)
[![Platform](https://img.shields.io/cocoapods/p/Mute.svg?style=flat)](http://cocoapods.org/pods/Mute)

There is no native iOS API to detect if the mute switch is enabled/disabled on a device.

The general principle to check if the device is muted is to play a short sound and detect the length it took to play.
From this length we can determine if it was muted or not.

This library is effectively a Swift variant of [SoundSwitch](https://github.com/moshegottlieb/SoundSwitch).

Has a trigger rate of 1 second.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

```
import UIKit
import Mute

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel! {
        didSet {
            self.label.text = ""
        }
    }

    let mute = Mute.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        mute.alwaysNotify = true // `true` will notify every second of the mute switch state
        mute.notify = { m in
            self.label.text = m ? "Muted" : "Not Muted"
        }
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
