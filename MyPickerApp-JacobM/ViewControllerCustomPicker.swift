//
//  ViewControllerCustomPicker.swift
//  MyPickerApp-JacobM
//
//  Created by student on 3/1/22.
//

import UIKit

class ViewControllerCustomPicker: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  
    @IBOutlet weak var labelDisplay: UILabel!
    @IBOutlet var pickerCustom: UIPickerView!
    
    var pickerTheme: [String] = []
    var pickerColor: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerCustom.dataSource = self
        pickerCustom.delegate = self
        pickerTheme = ["Theme1", "Theme2", "Theme3"]
        pickerColor = ["Red", "Blue", "Green", "Black"]
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component{
        case 0:
            return pickerTheme.count
        default:
            return pickerColor.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component{
        case 0:
            return pickerTheme[row]
        default:
            return pickerColor[row]
        }
    }

    
    @IBAction func button1Tapped(_ sender: UIButton) {
        let themeIndex = pickerCustom.selectedRow(inComponent: 0)
        let colorIndex = pickerCustom.selectedRow(inComponent: 1)
        let alert1 = UIAlertController(title: "Change Theme?", message: "Theme:\(pickerTheme[themeIndex]) Color:\(pickerColor[themeIndex])", preferredStyle: .alert)
        let actionOk1 = UIAlertAction(title: "OK", style: .default, handler: {action -> Void in
            self.labelDisplay.text = "Current Theme: \(self.pickerTheme[themeIndex])- \(self.pickerColor[colorIndex])"
        })
        let actionCancel1 = UIAlertAction(title: "Cancel", style: .destructive, handler: {action -> Void in})
        alert1.addAction(actionOk1)
        alert1.addAction(actionCancel1)
        self.present(alert1, animated: true, completion: nil)
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
