//
//  ViewController.swift
//  MuteExample
//
//  Created by Steve Kim on 2021/01/14.
//

import Mute
import UIKit

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
    

    @IBAction func forceCheckPressed(_ sender: UIButton) {
        print("Force Check Pressed")
        Mute.shared.check()
    }
}

