//
//  ViewController.swift
//  Light
//
//  Created by GEU on 26/08/25.
//

import UIKit
var lightOn=true
class ViewController: UIViewController {
    @IBOutlet weak var lightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    fileprivate func UpdateUI()
    {
        if lightOn
        {
            view.backgroundColor = .white
            lightButton.setTitle("OFF",for: .normal)
        }
        else
        {
            view.backgroundColor = .black
            lightButton.setTitle("ON",for: .normal)
        }
    }
    
    @IBAction func Button(_ sender: Any)
    {
        lightOn.toggle()
        UpdateUI()
    }
    
}

