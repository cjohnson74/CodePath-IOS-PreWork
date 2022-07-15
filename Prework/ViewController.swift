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
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Percetage Number formatter
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .percent
        numFormatter.minimumIntegerDigits = 1
        numFormatter.maximumIntegerDigits = 2
        numFormatter.maximumFractionDigits = 1
        
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
        tipPercentage.text = numFormatter.string(for: Double(tipControl.value / 100))
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        // Update the total per person label
        totalPerPerson.text = String(format: "%.2f", totalPP)
        // Update the bill per person
        billPerPerson.text = String(format: "%.2f", billPP)
        // Update the tip per person
        tipPerPerson.text = String(format: "%.2f", tipPP)    }
    
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

