//
//  ViewController.swift
//  tipster
//
//  Created by Matthew on 8/22/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipInterface: UIView!
    
    override func viewDidLoad() {
        billField.becomeFirstResponder()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        UIView.animate(withDuration: 1.0, animations: {
            self.tipInterface.alpha = 0
            self.tipControl.alpha = 0
        })
    }
    
    @IBAction func setBillValue(_ sender: Any) {
        UIView.animate(withDuration: 1.0, animations: {
            self.tipInterface.alpha = 1
            self.tipControl.alpha = 1
        })
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
}
