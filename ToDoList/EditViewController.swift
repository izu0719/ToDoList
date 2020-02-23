//
//  EditViewController.swift
//  ToDoList
//
//  Created by 坂本 泉 on 2020/02/21.
//  Copyright © 2020 mycompany. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet var editTextField: UITextField!
    
    var todoArray = [String]()
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var selectedCell: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if saveData.object(forKey: "todo") != nil{
            
            todoArray = saveData.object(forKey: "todo") as! [String]
            
        }
        
        selectedCell = saveData.object(forKey: "number") as? Int
        editTextField?.text = todoArray[selectedCell]
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editSave(){
        
        todoArray[selectedCell] = editTextField!.text!
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
