//
//  timerActionViewController.swift
//  timerApp
//
//  Created by 長坂豪士 on 2019/10/04.
//  Copyright © 2019 Tsuyoshi Nagasaka. All rights reserved.
//

import UIKit

class timerActionViewController: UIViewController {

    var timeString = String()
    var taskString = String()
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timeLabel.text = timeString
        taskLabel.text = taskString
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
