//
//  SettingsViewController.swift
//  Prework
//
//  Created by Carson Johnson on 7/15/22.
//

import UIKit

class SettingsViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var localCurrSwitch: UISwitch!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    var currencyTypes: [String] = [String]()
    var iosLocales: [String] = [String]()
    
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
        if(userSettings.bool(forKey: "useLocalCurrency")){
            localCurrSwitch.isOn = true;
        } else {
            localCurrSwitch.isOn = false;
            userSettings.set(currencyPicker.selectedRow(inComponent: 0), forKey: "currencyType")
        }
        
        // Connect currencyTypes data
        self.currencyPicker.delegate = self
        self.currencyPicker.dataSource = self
        
        // Currency Location picker data
        currencyTypes = ["United States Dollar", "Euro", "Canadian Dollar", "Japanese Yen", "Pound Sterling", "Poland (zloty)", "Brazil (Real)", "India (Rupee)", "Mongolia (tögrög)", "Nigerian Naira", "Thai Baht", "Philippine Peso"]
        // Currency iOS locales data
        iosLocales = ["en_US", "en_IE", "en_CA", "ja_JP", "en_GB", "pl_PL", "pt_BR", "or_IN", "mn_MN", "en_NG", "th_TH", "fil_PH"]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Access UserDefaults
        let userSettings = UserDefaults.standard
        
        // Set currency picker to proper currency type saved in userSettings
        let currencyIdx = userSettings.integer(forKey: "currencyTypeIdx")

        currencyPicker.selectRow(currencyIdx, inComponent: 0, animated: false)
    }
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyTypes.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyTypes[row]
    }
    
    // Capture the currencyPicker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        // Access UserDefaults
        let userSettings = UserDefaults.standard
        
//        // switches off local currency
//        localCurrSwitch.isOn = false
        
        // Sets the currencyType based on the picker
        userSettings.set(currencyTypes[row], forKey: "currencyType")
        userSettings.set(row, forKey: "currencyTypeIdx")
        userSettings.set(iosLocales[row], forKey: "iosLocale")
        
        // Force UserDefaults to save
        userSettings.synchronize()
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
    
    @IBAction func switchUseLocal(_ sender: UISwitch) {
        
        // Access UserDefaults
        let userSettings = UserDefaults.standard
        
        // Create currency number formatter to save in user default settings
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        
        
        // This sets a value to determine if current location currency will be used by default
        if(sender.isOn){
            userSettings.set(true, forKey: "useLocalCurrency")
        } else {
            userSettings.set(false, forKey: "useLocalCurrency")
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
