//
//  ViewController.swift
//  Calculator
//
//  Created by GEU on 27/08/25.
//

import UIKit
class ViewController: UIViewController
{
    
    @IBOutlet weak var TextField: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    @IBAction func buttonAC(_ sender: Any)
    {
        TextField.text=""
    }
    @IBAction func buttonBack(_ sender: Any)
    {
        TextField.text?.removeLast()
    }
    @IBAction func buttonBracket(_ sender: Any)
    {
        TextField.text?.append("(")
    }
    @IBAction func buttonDivision(_ sender: Any)
    {
        TextField.text?.append("/")
    }
    @IBAction func buttonMultiplication(_ sender: Any)
    {
        TextField.text?.append("*")
    }
    @IBAction func button9(_ sender: Any)
    {
        TextField.text?.append("9")
    }
    @IBAction func button8(_ sender: Any)
    {
        TextField.text?.append("8")
    }
    @IBAction func button7(_ sender: Any)
    {
        TextField.text?.append("7")
    }
    @IBAction func button6(_ sender: Any)
    {
        TextField.text?.append("6")
    }
    @IBAction func button5(_ sender: Any)
    {
        TextField.text?.append("5")
    }
    @IBAction func button4(_ sender: Any)
    {
        TextField.text?.append("4")
    }
    @IBAction func button3(_ sender: Any)
    {
        TextField.text?.append("3")
    }
    @IBAction func button2(_ sender: Any)
    {
        TextField.text?.append("2")
    }
    @IBAction func button1(_ sender: Any)
    {
        TextField.text?.append("1")
    }
    @IBAction func button0(_ sender: Any)
    {
        TextField.text?.append("0")
    }
    @IBAction func buttonSubtraction(_ sender: Any)
    {
        TextField.text?.append("-")
    }
    @IBAction func buttonAddition(_ sender: Any)
    {
        TextField.text?.append("+")
    }
    @IBAction func buttonResult(_ sender: Any)
    {
        if let expression = TextField.text
        {
            let exp = NSExpression(format: expression)
            if let result = exp.expressionValue(with: nil, context: nil) as? NSNumber
            {
                TextField.text = result.stringValue
            }
            else
            {
                TextField.text = "Error"
            }
        }
    }
}
