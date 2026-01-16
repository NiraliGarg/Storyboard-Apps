//
//  ViewController.swift
//  SetandClearText
//
//  Created by GEU on 13/10/25.
//

import UIKit
class ViewController: UIViewController
{
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    @IBAction func setText(_ sender: Any)
    {
        label.text=textField.text
    }
    @IBAction func clearText(_ sender: Any)
    {
        label.text=""
    }
}

