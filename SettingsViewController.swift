//
//  SettingsViewController.swift
//  Prework
//
//  Created by Carson Johnson on 7/15/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var localCurrSwitch: UISwitch!
    @IBOutlet weak var locationPicker: UIPickerView!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Access UserDefaults
        let userSettings = UserDefaults.standard
        
        // Set dark mode switch and user interface style based on default key "darkMode"
        if(userSettings.bool(forKey: "darkMode")){
            darkModeSwitch.isOn = true;
            overrideUserInterfaceStyle = .dark;
        } else {
            darkModeSwitch.isOn = false;
            overrideUserInterfaceStyle = .light
        }
    }
    
    @IBAction func darkMode(_ sender: UISwitch) {
        
        // Access UserDefaults
        let userSettings = UserDefaults.standard
        
        // Sets the background color based on darkmode variable
        if(sender.isOn){
            userSettings.set(true, forKey: "darkMode")
            overrideUserInterfaceStyle = .dark
        } else {
            userSettings.set(false, forKey: "darkMode")
            overrideUserInterfaceStyle = .light
        }
        
        // Force UserDefaults to save
        userSettings.synchronize()
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
