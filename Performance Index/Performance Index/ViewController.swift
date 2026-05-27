//
//  ViewController.swift
//  StudentResultPredicter
//
//  Created by AyaanCDZ on 13/02/26.
//

import UIKit
import CoreML

class ViewController: UIViewController
{
    @IBOutlet weak var QPStepper: UIStepper!
    @IBOutlet weak var SleepStepper: UIStepper!
    @IBOutlet weak var HoursStepper: UIStepper!
    
    @IBOutlet weak var Calculate: UIButton!
    @IBOutlet weak var HoursLabel: UILabel!
    @IBOutlet weak var SleepLabel: UILabel!
    @IBOutlet weak var QPLabel: UILabel!
    
    @IBOutlet weak var PreviousScoreText: UITextField!
    
    @IBOutlet weak var ExtraCurricularSwitch: UISwitch!
    
// MARK: ML Inference Function
    func runMLPrediction() -> Double?
    {
        do
        {
            let model = try Student_Performance_Prediction_(configuration: .init()).model
            // Bool → String (required by OneHotEncoder)
            let extraValue = ExtraCurricularSwitch.isOn ? "Yes" : "No"
            // Int64 conversion (model expects Int64)
            let hours = Int64(HoursStepper.value)
            let sleep = Int64(SleepStepper.value)
            let qp = Int64(QPStepper.value)
            let prev = Int64(previousScore)
            
// MARK: Inputs
            
            let inputFeatures: [String: Any] = [
                "Hours Studied": hours,
                "Previous Scores": prev,
                "Extracurricular Activities": extraValue,
                "Sleep Hours": sleep,
                "Sample Question Papers Practiced": qp
            ]

            let provider = try MLDictionaryFeatureProvider(dictionary: inputFeatures)

            let result = try model.prediction(from: provider)

            // Exact output name
            if let value = result
                .featureValue(for: "Performance Index")?
                .doubleValue {

                return value
            }

            return nil

        }
        catch
        {

            print("ML ERROR:", error)
            return nil
        }
    }
    func showError(_ message: String)
    {

        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    @IBAction func CalculatePressed(_ sender: UIButton)
    {
        getAllInputs()
        guard let prediction = runMLPrediction() else {
            showError("Prediction failed")
            return
        }

        showResult(prediction)
    }
    func showResult(_ value: Double)
    {
        let formatted = String(format: "%.2f", value)
        let alert = UIAlertController(
            title: "Performance Index",
            message: "Your Score: \(formatted)",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    @IBAction func HoursChanged(_ sender: UIStepper)
    {

        hoursStudied = sender.value
        HoursLabel.text = "\(Int(sender.value))"
    }
    @IBAction func SleepChanged(_ sender: UIStepper)
    {

        sleepHours = sender.value
        SleepLabel.text = String(format: "%.1f", sender.value)
    }
    @IBAction func QPChanged(_ sender: UIStepper)
    {

        qpSolved = sender.value
        QPLabel.text = "\(Int(sender.value))"
    }
    @IBAction func ExtraCurricularChanged(_ sender: UISwitch)
    {

        hasExtraCurricular = sender.isOn
    }
    @IBAction func PreviousScoreChanged(_ sender: UITextField)
    {

        if let text = sender.text,
           let value = Double(text) {
            previousScore = value
        } else {
            previousScore = 0
        }
    }
    var hoursStudied: Double = 0
    var sleepHours: Double = 0
    var qpSolved: Double = 0
    var previousScore: Double = 0
    var hasExtraCurricular: Bool = false
    
    func getAllInputs()
    {
        // Read Previous Score
        if let text = PreviousScoreText.text,
           let value = Double(text) {
            previousScore = value
        }
        else
        {
            previousScore = 0
        }
        // Read Switch
        hasExtraCurricular = ExtraCurricularSwitch.isOn

        // Read Steppers (for safety sync)
        hoursStudied = HoursStepper.value
        sleepHours = SleepStepper.value
        qpSolved = QPStepper.value
    }
    
    func updateAllLabels()
    {
        HoursLabel.text = "\(Int(HoursStepper.value))"
        SleepLabel.text = String(format: "%.1f", SleepStepper.value)
        QPLabel.text = "\(Int(QPStepper.value))"

        hoursStudied = HoursStepper.value
        sleepHours = SleepStepper.value
        qpSolved = QPStepper.value

        hasExtraCurricular = ExtraCurricularSwitch.isOn
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateAllLabels()
    }


}
