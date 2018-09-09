//
//  PatientViewPosts.swift
//  reMEDI
//
//  Created by Ruhi Kore on 9/8/18.
//  Copyright © 2018 Ruhi Kore. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class PatientViewPosts: UIViewController {

    var posts = [Post]()
    
    @IBOutlet var postLabel: UILabel!
    @IBOutlet var postDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.fetchPosts()
        print ("hello")
       // print(posts.count)
        //let myPostDescription = posts[0].post as! String
        //let myPostDate = posts[0].date as! String
        
        //self.postLabel.text = "Post: \(myPostDescription)"
       // self.postDateLabel.text = "Post Date: \(myPostDate)"
        
        
        
        //self.tableView.register(CustomCell.self, forCellReuseIdentifier: "custom")
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell
        cell.post = posts[indexPath.row].post
        cell.date = posts[indexPath.row].date
        return cell
    } */
    
    //returns the number of cells that there are going to be
    /*override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    } */
    
    /*func fetchPosts() {
        let ref = Database.database().reference().child("posts")
        let currentUserID = Auth.auth().currentUser!.uid
        ref.observe(DataEventType.value) { (snapshot) in
            if snapshot.childrenCount > 0 {
                print ("it recognizes posts in firebase")
                for posts in snapshot.children.allObjects as! [DataSnapshot] {
                    let postObject = posts.value as? [String: AnyObject]
                    let currentPostID = postObject?["userID"] as! String
                    if currentPostID == currentUserID {
                        print (postObject?["post"] as! String)
                        //if the post's user ID matches the current user ID, you want to create a new Post object and append it to the posts array
                        let currentPost = Post()
                        let post = postObject?["post"] as! String
                        let date = postObject?["postDate"] as! String
                        let userID = postObject?["userID"] as! String
                        let postID = postObject?["postID"] as! String
                        currentPost.post = post
                        currentPost.date = date
                        currentPost.userID = userID
                        currentPost.postID = postID
                        
                        self.posts.append(currentPost)
                        print ("has appended")
                    }
                }
            }
        }
        //ref.removeAllObservers()
    } */
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "backToDashboardSegue", sender: self)
        
    }
    
    
}
