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
    @IBOutlet weak var infoLabel: UILabel! // not used yet
    @IBOutlet weak var stopButton: UIButton!
    
    var timer: Timer?
    var time = 0
    var exercises: [Exercise] = []
    var exIndex = 0
    var isRest = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timerView.layer.cornerRadius = timerView.layer.bounds.width / 2
        timerView.clipsToBounds = true
        
        exerciseLabel.text = exercises[exIndex].name
        time = exercises[exIndex].time
        
        setBorder(for: time)
        
        timerLabel.text = "\(time)"
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateLabel),
                                     userInfo: nil, repeats: true)
    }
    /// Set border color (1 of 3) depending on time
    func setBorder(for time: Int) {
        switch time {
        case 6...10:
            setOrangeBorder()
        case 0...5:
            setRedBorder()
        default:
            setNormal()
        }
    }
    
    @objc func updateLabel() {
        
        time -= 1
        timerLabel.text = "\(time)"
        
        if !isRest && time < 11 {
            if time < 6 {
                setRedBorder()
            } else {
                setOrangeBorder()
            }
        }

        if time < 0 {
            // Reset view for Rest timer
            if !isRest {
                isRest = true
                exerciseLabel.text = "Rest Time"
                time = exercises[exIndex].restTime
                timerLabel.text = "\(time)"
                setRest()
            } else {
                // Reset view for next exercise
                isRest = false
                exIndex += 1
                // Check if we reached last exercise
                if exIndex != exercises.count {
                    exerciseLabel.text = exercises[exIndex].name
                    time = exercises[exIndex].time
                    timerLabel.text = "\(time)"
                    setBorder(for: time)
                } else {
                    // No more exercises
                    timer?.invalidate()
                    setNoBorder()
                    timerLabel.text = "🏆"
                    exIndex = 0
                    exerciseLabel.text = "Well Done!"
                    exerciseLabel.textColor = .systemOrange
                    stopButton.setTitle("Go Back", for: .normal)
                }
            }
        }
    }

    func setNoBorder() {
        timerView.backgroundColor = .clear
        timerView.layer.borderWidth = 0.0
    }
    
    func setRedBorder() {
        timerView.backgroundColor = .clear
        timerView.layer.borderColor = UIColor.systemRed.cgColor
        timerView.layer.borderWidth = 3.0
    }
    
    func setOrangeBorder() {
        timerView.backgroundColor = .clear
        timerView.layer.borderColor = UIColor.systemOrange.cgColor
        timerView.layer.borderWidth = 3.0
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
        timer?.invalidate()
        dismiss(animated: true, completion: nil)
    }
    
} // class
