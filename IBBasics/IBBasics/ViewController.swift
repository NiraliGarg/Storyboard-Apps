//
//  ViewController.swift
//  IBBasics
//
//  Created by GEU on 25/08/25.
//

import UIKit
class ViewController: UIViewController
{

    @IBOutlet weak var TextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func ChangeLoaction(_ sender: Any)
    {
        TextField.text="I am in Graphic Era"
    }
}

