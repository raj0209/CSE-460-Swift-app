//
//  CalculatorViewController.swift
//  BMIPhase1
//
//  Created by Apple on 25/06/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var BMIModel : Model = Model()
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var outputValueField: UITextField!
    @IBOutlet weak var messageField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func calculateButton(_ sender: Any) {
        
        let heightDouble: Double? = Double(heightField.text!)
        let weightDouble: Double? = Double(weightField.text!)
                   
        let bmiValue = BMIModel.calculateBMI(heightDouble: heightDouble!, weightDouble: weightDouble!)
                   
        let bmiVal = String(format:"%.1f",bmiValue)
                   
        outputValueField.text = bmiVal
               
        if(bmiValue<18){
            messageField.text = "You are underweight"
            messageField.textColor = UIColor.blue
            outputValueField.textColor = UIColor.blue
        }
        else if(bmiValue<25){
            messageField.text = "You are normal"
            messageField.textColor = UIColor.green
            outputValueField.textColor = UIColor.green
        }
        else if(bmiValue<30){
            messageField.text = "You are pre-obese"
            messageField.textColor = UIColor.purple
            outputValueField.textColor = UIColor.purple
        }
        else{
            messageField.text = "You are obese"
            messageField.textColor = UIColor.red
            outputValueField.textColor = UIColor.red
        }
    }
}
