//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stepper.value = 2
        stepper.minimumValue = 1
    }
    func percentStringToFloat(_ percentString: String) -> Float? {
        if let number = Float(percentString.trimmingCharacters(in: CharacterSet(charactersIn: "%"))) {
            return number / 100
        }
        return nil
    }
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        if let tipTitle = sender.currentTitle, let tipValue = percentStringToFloat(tipTitle) {
                    print("Selected tip: \(tipValue)")
                }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(splitNumberLabel.text!)
    }
}

