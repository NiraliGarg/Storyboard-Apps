//
//  ViewController.swift
//  TipCalculator
//
//  Created by GEU on 05/01/26.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var totalAmountLabel: UILabel!
        @IBOutlet var tipAmountLabel: UILabel!
        @IBOutlet var mainSwitch: UISwitch!
        @IBOutlet var tipSegmentedControl: UISegmentedControl!
        @IBOutlet var billTextField: UITextField!
        override func viewDidLoad()
        {
            super.viewDidLoad()
        }
        
    @IBAction func segementSelected(_ sender: Any)
    {
        if mainSwitch.isOn
        {
            let bill=Double(billTextField.text!) ?? 0
            let tipPercentage: Double
            switch tipSegmentedControl.selectedSegmentIndex
            {
                case 0:tipPercentage = 0.15
                case 1:tipPercentage = 0.18
                case 2:tipPercentage = 0.20
                default:tipPercentage = 0.00
            }
            let tip = bill * tipPercentage
            let total = bill + tip
            totalAmountLabel.text = String(format: "$%.2f", total)
            tipAmountLabel.text = String(format: "$%.2f", tip)
        }
    }
    @IBAction func resetButtonPressed(_ sender: Any)
    {
        totalAmountLabel.text = "$0.00"
        tipAmountLabel.text = "$0.00"
        billTextField.text = ""
        tipSegmentedControl.selectedSegmentIndex = 0
        mainSwitch.isOn = false
    }

}

