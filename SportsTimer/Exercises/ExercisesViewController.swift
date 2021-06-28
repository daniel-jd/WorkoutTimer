//
//  ExercisesViewController.swift
//  SportsTimer
//
//  Created by Daniel Yamrak on 21.06.2021.
//

import UIKit

class ExercisesViewController: UIViewController {
    
    private let timerVC = "TimerViewController"
    private let startVC = "StartViewController"
    private let cellID = "ExerciseCell"
    private let cellNibName = "ExerciseTableViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var addMoreButton: UIButton!
    
    var exerciseList: [Exercise] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.layer.cornerRadius = startButton.frame.width / 2
        addMoreButton.layer.cornerRadius = addMoreButton.frame.width / 2
        
        tableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func startDidTap(_ sender: Any) {
        if exerciseList.count != 0 {
            // GO to timer screen
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: timerVC) as? TimerViewController {
                vc.modalPresentationStyle = .fullScreen
                vc.exercises = exerciseList
                present(vc, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func addMoreDidTap(_ sender: Any) {
        // Show StartViewController and call Add function
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: startVC) as? StartViewController {
            vc.modalPresentationStyle = .fullScreen
            vc.delegate = self
            present(vc, animated: true, completion: nil)
            vc.addExercise()
        }
    }
    
} // class


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

// MARK: - StartViewController Delegate
extension ExercisesViewController: StartViewControllerDelegate {
    func addedExercises(exercises: [Exercise]) {
        exerciseList.append(contentsOf: exercises)
        tableView.reloadData()
    }
}
