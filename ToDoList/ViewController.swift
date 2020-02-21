//
//  ViewController.swift
//  ToDoList
//
//  Created by 坂本 泉 on 2020/02/17.
//  Copyright © 2020 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    var saveData: UserDefaults = UserDefaults.standard
    
    var todoArray = [String]()
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        if saveData.object(forKey: "todo") != nil{
            
            todoArray = saveData.object(forKey: "todo") as! [String]
            
        } else if saveData.object(forKey: "todo") == nil{
            
        }
        table.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = todoArray[indexPath.row]
        
        return cell!
    }
    
    //セルの編集許可
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    //スワイプしたセルを削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let alert: UIAlertController = UIAlertController(title: "削除", message: "削除しますか？", preferredStyle: .alert)
        
        let deleteAlert: UIAlertAction = UIAlertAction(title: "削除", style: .default){(UIAlertAction) in
            if editingStyle == UITableViewCell.EditingStyle.delete {
                self.todoArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
                self.saveData.set(self.todoArray, forKey: "todo")
            }
        }
        
        alert.addAction(deleteAlert)
        alert.addAction(
            UIAlertAction(
                title: "キャンセル",
                style: .cancel,
                handler: { action in print("キャンセル")}
            )
        )
     
        present(alert, animated: true, completion: nil)
       
    }
    
}

