//
//  PatientNewPostVC.swift
//  reMEDI
//
//  Created by Ruhi Kore on 9/8/18.
//  Copyright © 2018 Ruhi Kore. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class PatientNewPostVC: UIViewController {
    
    @IBOutlet var descriptionTextView: UITextView!
    
    var ref: DatabaseReference!
    var refEmail: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
    }
    
    @IBAction func postBtnPressed(_ sender: Any) {
        let uid = Auth.auth().currentUser!.uid
        //let storage = Storage.storage().reference(forURL: "gs://remedi-healthcareapp.appspot.com")
        let key = ref.child("posts").childByAutoId().key
        //let postRef = storage.child("posts").child(uid).child("\(key)")
        //var userEmail: String!
        
        //refEmail = Database.database().reference().child("patientUsers").child(uid)
        //ref.observe(DataEventType.value) { (snapshot) in
        //if snapshot.childrenCount > 0 {
        //userEmail = self.refEmail.child("emailid") as? String
        //}
        //}
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        let result = formatter.string(from: date)
        
        if descriptionTextView.text != "Feel free to add the duration, symptoms, any medication you are taking, etc." {
            let feed = ["userID": uid,
                        "post": descriptionTextView.text,
                        "postID": key,
                        "postDate": result] as [String : Any]
            let postFeed = ["\(key)" : feed]
            ref.child("posts").updateChildValues(postFeed)
            self.performSegue(withIdentifier: "successfulPostSegue", sender: self)
            
            //self.ref.child("posts").
        }
    }
    
    
}
