//
//  CustomCell.swift
//  reMEDI
//
//  Created by Ruhi Kore on 9/8/18.
//  Copyright © 2018 Ruhi Kore. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    var post: String?
    var date: String?
    
    var postView : UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    } ()
    
    var dateView : UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    } ()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(postView)
        self.addSubview(dateView)
        
        postView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        postView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        postView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        postView.bottomAnchor.constraint(equalTo: self.dateView.topAnchor).isActive = true
        
        dateView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        dateView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        dateView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let post = post {
            postView.text = post
        }
        
        if let date = date {
            dateView.text = date
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
