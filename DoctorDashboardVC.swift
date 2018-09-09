//
//  DoctorDashboardVC.swift
//  reMEDI
//
//  Created by Ruhi Kore on 9/8/18.
//  Copyright © 2018 Ruhi Kore. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class DoctorDashboardVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func myAcctBtnPressed(_ sender: Any) {
        
        
        self.performSegue(withIdentifier: "drMyAcctSegue", sender: self)
    }
    
    
    @IBAction func viewPostsPressed(_ sender: Any) {
        
    }
}
