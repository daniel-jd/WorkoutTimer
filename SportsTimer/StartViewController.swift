//
//  ViewController.swift
//  SportsTimer
//
//  Created by Daniel Yamrak on 19.06.2021.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = addButton.frame.width / 2
    }


    @IBAction func addDidTap(_ sender: UIButton) {
        print("Add Button Pressed 🐣")
    }
}

