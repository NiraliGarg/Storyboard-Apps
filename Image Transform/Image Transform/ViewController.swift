//
//  ViewController.swift
//  Image Transform
//
//  Created by GEU on 13/10/25.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    @IBAction func transform(_ sender: UISlider)
    {
        let size=CGFloat(sender.value)
        image.transform=CGAffineTransform(scaleX: size,y: size)
    }
}

