//
//  ExercisesViewController.swift
//  SportsTimer
//
//  Created by Daniel Yamrak on 21.06.2021.
//

import UIKit

class ExercisesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var addMoreButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.layer.cornerRadius = startButton.frame.width / 2
        addMoreButton.layer.cornerRadius = addMoreButton.frame.width / 2
    }
    
    @IBAction func startDidTap(_ sender: Any) {
    }
    @IBAction func addMoreDidTap(_ sender: Any) {
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
