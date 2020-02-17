//
//  ToDoAddViewController.swift
//  ToDoList
//
//  Created by 坂本 泉 on 2020/02/17.
//  Copyright © 2020 mycompany. All rights reserved.
//

import UIKit

class ToDoAddViewController: UIViewController {
    
    @IBOutlet var toDoTextField: UITextField!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var todoArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if saveData.object(forKey: "todo") != nil{
            todoArray = saveData.object(forKey: "todo") as! [String]
        }
    }
    @IBAction func save(){
        todoArray.append(toDoTextField.text!)
        saveData.set(todoArray, forKey: "todo")
        
        self.navigationController?.popViewController(animated: true)
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
