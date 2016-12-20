//
//  ViewController.swift
//  fastlanetest
//
//  Created by p_t on 12/13/16.
//  Copyright © 2016 p_t. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel! {
        didSet {
            label.text = "hello, world"
            label.isHidden = true
        }
    }
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.setTitle("Button", for: .normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        label.isHidden = false
    }
}
