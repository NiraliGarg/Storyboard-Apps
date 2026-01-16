//
//  ViewController.swift
//  RGB With Slider
//
//  Created by GEU on 13/10/25.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var red: UISlider!
    @IBOutlet weak var green: UISlider!
    @IBOutlet weak var blue: UISlider!
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    @IBAction func redSlider(_ sender: Any)
    {
        updateBackground()
    }
    @IBAction func greenSlider(_ sender: Any)
    {
        updateBackground()
    }
    @IBAction func blueSlider(_ sender: Any)
    {
        updateBackground()
    }
    func updateBackground()
    {
        let r=CGFloat(red.value)
        let b=CGFloat(blue.value)
        let g=CGFloat(green.value)
        self.view.backgroundColor=UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}

