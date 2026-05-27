//
//  ViewController.swift
//  InterestCalculation
//
//  Created by GEU on 04/09/25.
//

import UIKit
class ViewController: UIViewController
{

    @IBOutlet weak var Principal: UITextField!
    @IBOutlet weak var Rate: UITextField!
    @IBOutlet weak var Time: UITextField!
    @IBOutlet weak var Result: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func compound(_ sender: Any)
    {
        guard let pText=Principal.text,let p=Double(pText),let rText=Rate.text,let r=Double(rText),let tText=Time.text,let t=Double(tText)
        else
        {
            Result.text = "Invalid input!"
            return
        }

        let amount = p * pow((1 + r/100), t)
        let ci = amount - p
        Result.text = String(format: "%.2f", ci)
    }
    @IBAction func simple(_ sender: Any)
    {
        guard let pText=Principal.text,let p=Double(pText),let rText=Rate.text,let r=Double(rText),let tText=Time.text,let t=Double(tText)
            else
            {
                Result.text = "Invalid input!"
                return
            }

            let si=p*r*t/100
            Result.text = String(format: "%.2f", si)
    }
}

