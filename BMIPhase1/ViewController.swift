//
//  ViewController.swift
//  BMIPhase1
//
//  Created by Apple on 25/06/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateBMIView(_ sender: Any) {
        performSegue(withIdentifier: "calculator", sender: self)
    }
    
    @IBAction func bmiAPIView(_ sender: Any) {
        performSegue(withIdentifier: "api", sender: self)
    }
}

