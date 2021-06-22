//
//  ViewController.swift
//  SportsTimer
//
//  Created by Daniel Yamrak on 19.06.2021.
//

import UIKit

class StartViewController: UIViewController {
    
    private let exercisesVC = "ExercisesViewController"
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = addButton.frame.width / 2
    }


    @IBAction func addDidTap(_ sender: UIButton) {
        
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

            if let exercise = exerciseTextField?.text {
                print("Exercise name = \(exercise)")
            } else {
                print("No Exercise entered")
            }

            if let exTime = exTimeTextField?.text {
                print("Time for exercise = \(exTime)")
            } else {
                print("No time entered")
            }
            
            if let restTime = restTimeTextField?.text {
                print("Time for rest = \(restTime)")
            } else {
                print("No time entered")
            }
            
            // Goto ExercisesViewController
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: self!.exercisesVC)
            vc.modalPresentationStyle = .fullScreen
            self!.present(vc, animated: true, completion: nil)
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
            exTimeTextField?.placeholder = "Time for exercise"
        }
        
        alertController.addTextField {
            (restTime) -> Void in
            restTimeTextField = restTime
            restTimeTextField?.placeholder = "Time for rest"
        }

        // 5.
        alertController.addAction(addExerciseAction)
        present(alertController, animated: true, completion: nil)
        
        alertController.addAction(cancelExerciseAction)
        
        // TODO: Add exercise to exerciseList
        //exerciseList.append(Exercise(name: "Name", time: 30))
        
    }
}

