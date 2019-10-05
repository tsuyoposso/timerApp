//
//  ViewController.swift
//  timerApp
//
//  Created by 長坂豪士 on 2019/10/04.
//  Copyright © 2019 Tsuyoshi Nagasaka. All rights reserved.
//

import UIKit

class timeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {


    
    @IBOutlet weak var timerTableView: UITableView!
    
    var timeArray: [String] = ["10", "25", "60"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerTableView.delegate = self
        timerTableView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = timerTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = timeArray[indexPath.row] + "min"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let taskVC = storyboard?.instantiateViewController(identifier: "taskVC") as! taskViewController
        
        taskVC.setTime = timeArray[indexPath.row]
        navigationController?.pushViewController(taskVC, animated: true)
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height / 6
    }
}

