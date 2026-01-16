//
//  ViewController.swift
//  Counter
//
//  Created by GEU on 04/09/25.
//

import UIKit

class ViewController: UIViewController
{
    var status:Bool=false
    var counter:Int=0
    @IBOutlet weak var counterLabel: UILabel!
    @IBAction func incrementCounter(_ sender: Any)
    {
        if status
        {
            updateCounterLabel()
        }
    }
    @IBAction func start(_ sender: Any)
    {
        startapp()
    }
    @IBAction func stop(_ sender: Any)
    {
        stopapp()
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func updateCounterLabel()
    {
        counter+=1
        counterLabel.text="\(counter)"
    }
    func startapp()
    {
        status=true
    }
    func stopapp()
    {
        status=false
    }
}

