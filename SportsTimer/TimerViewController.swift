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
    
    var timer: Timer?
    var time = 0
    var restTime = 0
    var exercises: [Exercise] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exerciseLabel.text = exercises[0].name
        time = exercises[0].time
        restTime = exercises[0].restTime
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)

    }
    
    override func viewDidLayoutSubviews() {
        timerView.layer.cornerRadius = timerView.layer.bounds.width / 2
        timerView.clipsToBounds = true
        
        setNormal()
        
        if time < 5 {
            if time % 2 == 0 {
                setRed()
            } else {
                setGreen()
            }
        }
    }
    
    @objc func updateLabel() {
        timerLabel.text = "\(time)"
        time -= 1
        
        if time < 0 {
            timer?.invalidate()
        }
    }
    
    func setRed() {
        timerView.backgroundColor = .systemRed
        timerView.layer.borderWidth = 0.0
    }
    
    func setGreen() {
        timerView.backgroundColor = .systemGreen
        timerView.layer.borderWidth = 0.0
    }
    
    func setNormal() {
        timerView.backgroundColor = .clear
        timerView.layer.borderColor = UIColor.systemGreen.cgColor
        timerView.layer.borderWidth = 3.0
    }
    
    func setRest() {
        timerView.backgroundColor = .clear
        timerView.layer.borderColor = UIColor.systemTeal.cgColor
        timerView.layer.borderWidth = 3.0
    }
    
    @IBAction func stopDidTap(_ sender: Any) {
        // Stop the timer
        // Goto ExercisesVC
        dismiss(animated: true, completion: nil)
    }
    
}
