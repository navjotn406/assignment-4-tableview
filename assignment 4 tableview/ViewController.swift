//
//  ViewController.swift
//  assignment 4 tableview
//
//  Created by Navjot Singh on 2022-12-04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var tableview: UITableView!
    
    var strArr = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onclickAddBtn(_ sender: Any) {
        if let text = txtInput.text, !text.isEmpty{
            self.strArr.insert(text, at: 0)
            tableview.beginUpdates()
            tableview.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
            tableview.endUpdates()
            txtInput.text = nil
        }
    }
    
}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "editTableViewCell", for: indexPath) as? editTableViewCell else {return UITableViewCell()}
        cell.textLabel?.text = txtInput.text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            strArr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .none)
        }
    }

}




