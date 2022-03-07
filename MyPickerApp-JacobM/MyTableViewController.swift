//
//  MyTableViewController.swift
//  MyPickerApp-JacobM
//
//  Created by student on 3/6/22.
//

import UIKit

class MyTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var appTable: UITableView!
    
    let appArray = [["a", "apple store"], ["d", "discord"], ["f", "facebook"], ["i"], ["instagram"], ["s", "snap chat", "safari"]]
    let appIndex = ["a", "d", "f", "i", "s"]
    var cellID = "cellID"
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appArray[section].count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = appArray[indexPath.section][indexPath.row + 1]
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return appArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return appArray[section][0] //the section is the array within app array and 0 is the index to display
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return appIndex
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Selected", message: "\(appArray[indexPath.section][indexPath.row + 1])", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {action -> Void in})
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        appTable.delegate = self
        appTable.dataSource = self
        appTable.sectionIndexColor = UIColor.white
        appTable.sectionIndexBackgroundColor = UIColor.black
        appTable.sectionIndexTrackingBackgroundColor = UIColor.darkGray
        // Do any additional setup after loading the view.
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
