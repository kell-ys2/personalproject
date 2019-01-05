//
//  Slide.swift
//  jan4PPextended
//
//  Created by Kelly Shu on 4/1/2019.
//  Copyright © 2019 CDNIS. All rights reserved.
//

import UIKit

class Slide: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelNumb: UILabel!
  
     func viewDidLoad() {
       
        imageView.layer.cornerRadius = 10000
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
    }
    
     func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
}
