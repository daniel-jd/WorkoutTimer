//
//  TimerViewController.swift
//  SportsTimer
//
//  Created by Daniel Yamrak on 21.06.2021.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timerView.layer.cornerRadius = timerView.frame.width / 2
    }
    

    @IBAction func stopDidTap(_ sender: Any) {
        // Stop the timer
        // Goto ExercisesVC
        dismiss(animated: true, completion: nil)
    }
    
}
