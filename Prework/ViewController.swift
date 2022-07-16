//
//  ViewController.swift
//  Prework
//
//  Created by Carson Johnson on 7/14/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var peopleCountSelector: UISegmentedControl!
    @IBOutlet weak var tipControl: UISlider!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var billPerPerson: UILabel!
    @IBOutlet weak var tipPerPerson: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Access UserDefaults
        let userSettings = UserDefaults.standard
        
        // Sets user interface style based on default value of "darkMode" in userDefaults
        if(userSettings.bool(forKey: "darkMode")){
            overrideUserInterfaceStyle = .dark;
        } else {
            overrideUserInterfaceStyle = .light
        }
        
        calculateTip((Any).self)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Percetage Number formatter
        let percentageFormatter = NumberFormatter()
        percentageFormatter.numberStyle = .percent
        percentageFormatter.minimumIntegerDigits = 1
        percentageFormatter.maximumIntegerDigits = 2
        percentageFormatter.maximumFractionDigits = 1
        
        // Access UserDefaults
        let userSettings = UserDefaults.standard
        
        // Get values from user default settings
        let useLocalCurrency = userSettings.bool(forKey: "useLocalCurrency")
        let currencyType = userSettings.string(forKey: "iosLocale")
        
        // Getting currencyFormatter from the user default settings
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.minimumIntegerDigits = 1
        currencyFormatter.maximumIntegerDigits = 2
        currencyFormatter.maximumIntegerDigits = 1
        if(useLocalCurrency){
            currencyFormatter.locale = Locale.current
        } else {
            currencyFormatter.locale = Locale(identifier: currencyType ?? "en_US")
        }
        
        // Get Total tip by multiplying tip * tipPercentage
        let tip = bill * Double(tipControl.value / 100)
        let total = bill + tip;
        
        // Get number of people to split the bill
        let numOfPeople = peopleCountSelector.selectedSegmentIndex+1;
        
        // Calculate total per person
        let totalPP = total / Double(numOfPeople)
        
        // Calculate bill per person
        let billPP = bill / Double(numOfPeople)
        
        // Calculate tip per person
        let tipPP = tip / Double(numOfPeople)
        
        // Update Tip Percentage label
        tipPercentage.text = percentageFormatter.string(for: Double(tipControl.value / 100))
        // Update Tip Amount Label
        tipAmountLabel.text = currencyFormatter.string(for: Double(tip))
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        // Update the total per person label
        totalPerPerson.text = String(format: "%.2f", totalPP)
        // Update the bill per person
        billPerPerson.text = String(format: "%.2f", billPP)
        // Update the tip per person
        tipPerPerson.text = String(format: "%.2f", tipPP)
    }
    
    @IBAction func changePersonCount(_ sender: UISegmentedControl) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tip = bill * Double(tipControl.value / 100)
        let total = bill + tip;
        
        // Get number of people to split the bill
        let numOfPeople = peopleCountSelector.selectedSegmentIndex+1;
        
        // Calculate total per person
        let totalPP = total / Double(numOfPeople)
        
        // Calculate bill per person
        let billPP = bill / Double(numOfPeople)
        
        // Calculate tip per person
        let tipPP = tip / Double(numOfPeople)
        
        // Update the total per person label
        totalPerPerson.text = String(format: "%.2f", totalPP)
        // Update the bill per person
        billPerPerson.text = String(format: "%.2f", billPP)
        // Update the tip per person
        tipPerPerson.text = String(format: "%.2f", tipPP)
    }
}

