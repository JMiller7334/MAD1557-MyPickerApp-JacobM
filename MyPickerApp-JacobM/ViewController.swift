//
//  ViewController.swift
//  MyPickerApp-JacobM
//
//  Created by student on 3/1/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelTime: UILabel!
    @IBOutlet var labelTheme: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        print("loading Settings...")
        loadSettings()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func loadSettings(){
        labelTime.text = UserDefaults.standard.string(forKey: "keyTime")// Load up the Data
        labelTheme.text = UserDefaults.standard.string(forKey: "keyTheme")
        if labelTime.text == nil {
            labelTime.text = "Current Time: Not Set"
        }
        if labelTheme.text == nil {
            labelTheme.text = "Current Theme: Not Set"
        }
    }
    
    
    @IBAction func clearSettingsTapped(_ sender: UIButton) {
        UserDefaults.standard.set(nil, forKey: "keyTime")
        UserDefaults.standard.set(nil, forKey: "keyTheme")
        loadSettings()
    }
    
}

