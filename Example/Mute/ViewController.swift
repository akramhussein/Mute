//
//  ViewController.swift
//  Mute
//
//  Created by Akram Hussein on 09/08/2017.
//  Copyright (c) 2017 Akram Hussein. All rights reserved.
//

import UIKit
import Mute

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel! {
        didSet {
            self.label.text = ""
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        Mute.shared.notify = { m in
            self.label.text = m ? "Muted" : "Not Muted"
        }
    }

}
