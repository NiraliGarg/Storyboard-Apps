//
//  ViewController.swift
//  TimerApp
//
//  Created by GEU on 05/01/26.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var minuteSegment: UISegmentedControl!
    var timer = Timer()
    var secondsPassed = 0
    var totalSeconds = 0
    var isRunning = false
    override func viewDidLoad()
    {
        super.viewDidLoad()
        totalSeconds = 10 * 60
        secondsPassed=totalSeconds
        updateLabels()
    }
    @IBAction func minuteSegmentChanged(_ sender: UISegmentedControl)
    {
        switch sender.selectedSegmentIndex
        {
            case 0:totalSeconds = 10 * 60
            case 1:totalSeconds = 15 * 60
            case 2:totalSeconds = 30 * 60
            default:totalSeconds = 10 * 60
        }
        secondsPassed=totalSeconds
        updateLabels()
    }
    @IBAction func playTapped(_ sender: UIButton)
    {
        if isRunning == false && totalSeconds > 0
        {
            isRunning = true
            timer = Timer.scheduledTimer(timeInterval: 1.0,target: self,selector: #selector(updateTimer),userInfo: nil, repeats: true)
        }
    }
    @IBAction func pauseTapped(_ sender: UIButton)
    {
        timer.invalidate()
        isRunning = false
    }
    @IBAction func stopTapped(_ sender: UIButton)
    {
        timer.invalidate()
        isRunning = false
        secondsPassed = 0
        resetLabels()
    }
    @objc func updateTimer()
    {
        if secondsPassed > 0
        {
            secondsPassed -= 1
            updateLabels()
        }
        else
        {
            timer.invalidate()
            isRunning = false
            minuteSegment.isEnabled = true
        }
    }
    func updateLabels()
    {
        minutesLabel.text = String(format: "%02d", secondsPassed / 60)
        secondsLabel.text = String(format: "%02d", secondsPassed % 60)
    }
    func resetLabels()
    {
        secondsPassed = totalSeconds
        minutesLabel.text = "00"
        secondsLabel.text = "00"
    }
}
