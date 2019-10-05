//
//  taskViewController.swift
//  timerApp
//
//  Created by 長坂豪士 on 2019/10/04.
//  Copyright © 2019 Tsuyoshi Nagasaka. All rights reserved.
//

import UIKit

class taskViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {


    var setTime = String()
    
    @IBOutlet weak var taskTableView: UITableView!
    
    // ＋ボタンで追加したタスク
    var taskArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskTableView.delegate = self
        taskTableView.dataSource = self
    }
    
    
    
// ＋ボタンを押した時の処理
    @IBAction func tapAddButton(_ sender: Any) {
        
        let alertController = UIAlertController(title: "タスク追加", message: "タスクを入力してください", preferredStyle: UIAlertController.Style.alert)
        
        alertController.addTextField(configurationHandler: nil)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action: UIAlertAction) in
            
            if let textField = alertController.textFields?.first {
                self.taskArray.insert(textField.text!, at: 0)
                self.taskTableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.right)
            }
        }
        
        // OKボタンがタップされた時の処理
        alertController.addAction(okAction)
        // CANCELボタンがタップされた時の処理
        let cancelButton = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil)
        // CANCELボタンを追加
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
    }
    
    
// tableViewに関する記述
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = taskTableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
        
        cell.textLabel?.text = taskArray[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let timerActionVC = storyboard?.instantiateViewController(identifier: "TimerAction") as! timerActionViewController
        
        timerActionVC.timeString = setTime
        
        timerActionVC.taskString = taskArray[indexPath.row]
        navigationController?.pushViewController(timerActionVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.size.height / 6
    }
    
    
    
    
}
