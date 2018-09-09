//
//  ViewController.swift
//  reMEDI
//
//  Created by Ruhi Kore on 9/8/18.
//  Copyright © 2018 Ruhi Kore. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class MainScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func patientBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "patientLoginSegue", sender: self)
    }
    
    @IBAction func doctorBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "doctorLoginSegue", sender: self)
    }
    
}

