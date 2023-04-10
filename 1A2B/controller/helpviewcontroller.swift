//
//  helpviewcontroller.swift
//  1A2B
//
//  Created by 吳兆哲 on 2023/4/9.
//

import UIKit
class helpviewcontroller: UIViewController {
    
    @IBAction func startnewgame(_ sender: UIButton) {
        self.performSegue(withIdentifier: "gotonewgame", sender: self)

    }
    
    @IBAction func backtomenu(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
