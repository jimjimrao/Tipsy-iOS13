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
        
        // Add tap gesture recognizer to view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func viewTapped() {
        view.endEditing(true)
    }
    
    func percentStringToFloat(_ percentString: String) -> Float? {
        if let number = Float(percentString.trimmingCharacters(in: CharacterSet(charactersIn: "%"))) {
            return number / 100
        }
        return nil
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
            deselectAllButtons()
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
        guard let billTotal = Float(billTextField.text ?? "") else { return }
        tipBrain = TipBrain(billTotal: billTotal, splits: currentSplit, tipPct: currentTip)
        if let totalPerPerson = tipBrain?.calculatePerPerson() {
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult",
           let destinationVC = segue.destination as? ResultsViewController,
           let tipBrain = tipBrain {
            destinationVC.totalPerPersonValue = tipBrain.getTotal()
            destinationVC.numberOfPeople = tipBrain.getSplit()
            destinationVC.tipPercentage = tipBrain.getTip()
        }
    }
    
    private func deselectAllButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        }
    }

    
