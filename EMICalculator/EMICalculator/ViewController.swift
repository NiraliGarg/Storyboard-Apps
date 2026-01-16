//
//  ViewController.swift
//  EMICalculator
//
//  Created by GEU on 15/12/25.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var totalPayment: UILabel!
    @IBOutlet weak var principalInterest: UILabel!
    @IBOutlet weak var loanEMI: UILabel!
    @IBOutlet weak var loanAmountTextField: UITextField!
    @IBOutlet weak var interestSlider: UISlider!
    @IBOutlet weak var loanTenure: UILabel!
    @IBOutlet weak var interestRate: UILabel!
    @IBOutlet weak var tenureSlider: UISlider!
    @IBOutlet weak var totalpaymentText: UILabel!
    @IBOutlet weak var loanEMIText: UILabel!
    @IBOutlet weak var piText: UILabel!
    var loanAmountString = ""
    override func viewDidLoad()
    {
            super.viewDidLoad()
            tenureSlider.minimumValue = 1
            tenureSlider.maximumValue = 30
            interestSlider.minimumValue = 1
            interestSlider.maximumValue = 15
            loanAmountTextField.keyboardType = .numberPad
    }
    @IBAction func loanAmountChanged(_ sender: UITextField)
    {
        calculateEMI()
    }
    @IBAction func tenureSlider(_ sender: UISlider)
    {
        loanTenure.text = "\(Int(sender.value))"
        calculateEMI()
    }
    
    @IBAction func interestSlider(_ sender: UISlider)
    {
        interestRate.text = "\(Int(sender.value))"
        calculateEMI()
    }
    func calculateEMI()
    {
        guard let amountText = loanAmountTextField.text,
        let principal = Double(amountText),
                  principal > 0
        else
        {
            resetValues()
            return
        }
        let years = Double(Int(tenureSlider.value))
            let rate = Double(interestSlider.value)
            let monthlyRate = rate / 12 / 100
            let months = years * 12
            let emi = principal * monthlyRate * pow(1 + monthlyRate, months) /
                     (pow(1 + monthlyRate, months) - 1)
            let total = emi * months
            let interest = total - principal
            loanEMI.text = String(format: "₹ %.2f", emi)
            totalPayment.text = String(format: "₹ %.2f", total)
            principalInterest.text = String(format: "₹ %.2f", interest)
    }
    func resetValues()
    {
        loanEMI.text = "₹ 0"
        totalPayment.text = "₹ 0"
        principalInterest.text = "₹ 0"
    }
}

