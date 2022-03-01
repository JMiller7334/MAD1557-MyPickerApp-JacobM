//
//  ViewControllerDatePicker.swift
//  MyPickerApp-JacobM
//
//  Created by student on 3/1/22.
//

import UIKit

class ViewControllerDatePicker: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    let dateFormatter: DateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
        // Do any additional setup after loading the view.
    }
    
    func showAlert(data: String){
        let timeAlert = UIAlertController(title: "Set Time?", message: "Change time to: \(data)", preferredStyle: .alert)
        let timeCancel = UIAlertAction(title: "Cancel", style: .destructive, handler: {action -> Void in})
        let timeConfirm = UIAlertAction(title: "Confirm", style: .default, handler: {action -> Void in
            self.labelTitle.text = "Date recently changed to: \(data)"
        })
        timeAlert.addAction(timeConfirm)
        timeAlert.addAction(timeCancel)
        self.present(timeAlert, animated: true, completion: nil)
    }
    
    @IBAction func buttonConfirm(_ sender: UIButton) {
        let dateData: String = dateFormatter.string(from: datePicker.date)
        showAlert(data: dateData)
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
