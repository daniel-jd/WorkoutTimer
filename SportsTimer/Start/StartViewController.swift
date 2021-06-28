//
//  ViewController.swift
//  SportsTimer
//
//  Created by Daniel Yamrak on 19.06.2021.
//

import UIKit

protocol StartViewControllerDelegate: AnyObject {
    func addedExercises(exercises: [Exercise])
}

class StartViewController: UIViewController {
    
    private let exercisesVC = "ExercisesViewController"
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var exercises: [Exercise] = []
    weak var delegate: StartViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        addButton.layer.cornerRadius = addButton.frame.width / 2
    }
    
    @IBAction func letsGoPressed(_ sender: Any) {
        delegate?.addedExercises(exercises: exercises)
        dismiss(animated: true, completion: nil)
    }
    
    func addExercise() {
        
        // 1.
        var exerciseTextField: UITextField?
        var exTimeTextField: UITextField?
        var restTimeTextField: UITextField?

        // 2.
        let alertController = UIAlertController(
            title: "Add Exercise",
            message: "Set the time for exercise and rest",
            preferredStyle: .alert)

        // 3.
        let addExerciseAction = UIAlertAction(
        title: "Add", style: .default) { [weak self]
            (action) -> Void in

            guard let exercise = exerciseTextField?.text,
                  let exTime = exTimeTextField?.text,
                  let restTime = restTimeTextField?.text
            else {
                print("⚠️ input error?")
                return
            }
            
            self?.exercises.append(Exercise(name: exercise, time: Int(exTime)!, restTime: Int(restTime)!))
        }
        
        let cancelExerciseAction = UIAlertAction(
            title: "Cancel", style: .cancel)

        // 4.
        alertController.view.tintColor = .darkGray
        alertController.addTextField {
            (exerciseName) -> Void in
            exerciseTextField = exerciseName
            exerciseTextField!.placeholder = "Exrcise name"
        }

        alertController.addTextField {
            (exerciseTime) -> Void in
            exTimeTextField = exerciseTime
            exTimeTextField?.placeholder = "Exercise time"
        }
        
        alertController.addTextField {
            (restTime) -> Void in
            restTimeTextField = restTime
            restTimeTextField?.placeholder = "Rest time"
        }

        // 5.
        alertController.addAction(addExerciseAction)
        present(alertController, animated: true, completion: nil)
        
        alertController.addAction(cancelExerciseAction)
    }

    @IBAction func addDidTap(_ sender: UIButton) {
        addExercise()
    }
    
} // class

