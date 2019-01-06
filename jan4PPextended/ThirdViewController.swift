//
//  ThirdViewController.swift
//  jan4PPextended
//
//  Created by Kelly Shu on 4/1/2019.
//  Copyright © 2019 CDNIS. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var ansField1: UITextField!
    @IBOutlet weak var ansField2: UITextField!
    @IBOutlet weak var ansField3: UITextField!
    @IBOutlet weak var ansField4: UITextField!
    @IBOutlet weak var ansField5: UITextField!
    @IBOutlet weak var ansField6: UITextField!
    @IBOutlet weak var ansField7: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBAction func resetButton(_ sender: UIButton) {
        ansField1.text = ""
        ansField2.text = ""
        ansField3.text = ""
        ansField4.text = ""
        ansField5.text = ""
        ansField6.text = ""
        ansField7.text = ""
    
    }

 override func viewDidLoad() {
    super.viewDidLoad()

}


}
