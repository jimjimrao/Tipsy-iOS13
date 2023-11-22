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
    
    var currentTip: Float = 0.15
    var currentSplit = 2
    var tipBrain: TipBrain? 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stepper.value = 2
        stepper.minimumValue = 1
        billTextField.keyboardType = .decimalPad
        
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
        billTextField.endEditing(true)
        if let tipTitle = sender.currentTitle, let tipValue = percentStringToFloat(tipTitle) {
            currentTip = tipValue
                }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        currentSplit = Int(sender.value)
        
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
            let tip = self.currentTip
            let billTotal = Float(billTextField.text!) ?? 0.0
            let split = self.currentSplit
            tipBrain = TipBrain(billTotal: billTotal, splits: split, tipPct: tip) // Assign to the instance variable
            let totalPerPerson = tipBrain?.calculatePerPerson()
            print(totalPerPerson ?? 0.0)
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToResult" {
                let destinationVC = segue.destination as! ResultsViewController
                destinationVC.totalPerPersonValue = tipBrain?.getTotal() ?? 0.0
                destinationVC.numberOfPeople = tipBrain?.getSplit() ?? 0
                destinationVC.tipPercentage = tipBrain?.getTip() ?? 0.0
            }
        }
    }
