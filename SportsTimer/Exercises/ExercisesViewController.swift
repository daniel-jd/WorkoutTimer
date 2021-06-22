//
//  ExercisesViewController.swift
//  SportsTimer
//
//  Created by Daniel Yamrak on 21.06.2021.
//

import UIKit

struct Exercise {
    var name: String
    var time: Int
    var restTime: Int
}

class ExercisesViewController: UIViewController {
    
    private let timerVC = "TimerViewController"
    private let cellID = "ExerciseCell"
    private let cellNibName = "ExerciseTableViewCell"
    //     "ExerciseCell"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var addMoreButton: UIButton!
    
    var exerciseList: [Exercise] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = startButton.frame.width / 2
        addMoreButton.layer.cornerRadius = addMoreButton.frame.width / 2
        
        exerciseList.append(Exercise(name: "Push-ups", time: 10, restTime: 6))
        exerciseList.append(Exercise(name: "Abs", time: 12, restTime: 8))
        exerciseList.append(Exercise(name: "Jumps", time: 15, restTime: 10))
        
        tableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func startDidTap(_ sender: Any) {
        // GO to timer screen
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: timerVC) as? TimerViewController {
            vc.modalPresentationStyle = .fullScreen
            vc.exercises = exerciseList
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func addMoreDidTap(_ sender: Any) {
        // Show add exercise AlertViewController
    }
    
}


// MARK: - TableView Delegate
extension ExercisesViewController: UITableViewDelegate {
    
}

// MARK: - TableView DataSource
extension ExercisesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? ExerciseTableViewCell {
            tableView.rowHeight = cell.frame.height
            cell.exNameLabel?.text = exerciseList[indexPath.row].name
            cell.timeLabel?.text = String(exerciseList[indexPath.row].time)
            cell.restTimeLabel?.text = String(exerciseList[indexPath.row].restTime)
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    
}
