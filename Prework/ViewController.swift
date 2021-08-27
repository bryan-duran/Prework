//
//  ViewController.swift
//  Prework
//
//  Created by Bryan Duran on 8/24/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountField: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitBetween: UITextField!
    @IBOutlet weak var eachPays: UILabel!
    @IBOutlet weak var splitTipLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billAmountTextField.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

 
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let splitBtwn = Double(splitBetween.text!) ?? 0
        
        let tipPercentages = [0.15, 0.2, 0.25]
        let tipSelected = tipControl.selectedSegmentIndex
        let tipPercentage = tipPercentages[tipSelected]
        let tip = bill*tipPercentage
        let totalPrice = tip+bill
        
        var splitTipTotal = tip/splitBtwn
        
        if splitBtwn < 2 {
            splitTipTotal = tip
        }
        else if splitBtwn > 2 {
            splitTipTotal = tip/splitBtwn
        }
        
        var eachPay = (tip+bill)/splitBtwn
        
        if splitBtwn < 2 {
            eachPay = totalPrice
        }
        else if splitBtwn > 2 {
            eachPay = (tip+bill)/splitBtwn
        }
        
        
        tipAmountField.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", totalPrice)
        eachPays.text = String(format: "$%.2f", eachPay)
        splitTipLabel.text = String(format: "$%.2f", splitTipTotal)
        
    }
    
}

