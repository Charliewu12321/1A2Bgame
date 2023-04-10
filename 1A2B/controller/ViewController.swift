//
//  ViewController.swift
//  1A2B
//
//  Created by 吳兆哲 on 2023/4/4.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func startnewgame(_ sender: UIButton) {
        self.performSegue(withIdentifier: "gotonewgame", sender: self)
    }
    
    @IBAction func checkrecord(_ sender: UIButton) {
        self.performSegue(withIdentifier: "gotorecord", sender: self)
    }
    @IBAction func helpbutton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "gotohelp", sender: self)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}

