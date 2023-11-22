//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Jimmy Rao on 11/21/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalPerPersonValue: Float?
    var numberOfPeople: Int?
    var tipPercentage: Float?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pct = String(Int(tipPercentage! * 100))
        print(pct)
        totalLabel.text = String(format: "%.2f", totalPerPersonValue!)
        settingsLabel.text = String("Split between \(numberOfPeople!) people, with \(pct)% tip.")

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
