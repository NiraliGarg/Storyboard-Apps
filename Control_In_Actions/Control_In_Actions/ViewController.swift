//
//  ViewController.swift
//  Control_In_Actions
//
//  Created by GEU on 13/10/25.
//

import UIKit
class ViewController: UIViewController
{
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var Switch: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    @IBAction func Button(_ sender: Any)
    {
        sliderLabel.text=String(format:"%.2f",slider.value)
        if Switch.isOn
        {
            switchLabel.text="Switch is on"
        }
        else
        {
            switchLabel.text="Switch is off"
        }
    }
}

