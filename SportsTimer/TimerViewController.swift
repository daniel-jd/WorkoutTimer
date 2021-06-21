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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
