//
//  TipCalculatorViewController.swift
//  TipCalculator
//
//  Created by Aryan Vaid on 9/7/20.
//  Copyright © 2020 Aryan Vaid. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController {

    let defaults = UserDefaults.standard

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var perPersonAmountLabel: UILabel!
    @IBOutlet weak var partySizeStepper: UIStepper!
    
    @IBOutlet weak var plusLabel: UILabel!
    @IBOutlet weak var equalToLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        partySizeLabel.text = "1"
        DispatchQueue.main.async {
            self.billAmountTextField.becomeFirstResponder()
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let nightMode = defaults.string(forKey: "nightMode")
        if nightMode == "On"{
            nightModeTurnOn()
        }else {
            nightModeTurnOff()
        }
        reloadDefaultTipValues()
        reloadDisplayedData()
    }
    func nightModeTurnOn() {
        billAmountTextField.textColor = UIColor.white
        billAmountTextField.attributedPlaceholder = NSAttributedString(string: "$",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        tipPercentSelector.tintColor = UIColor.white
        partySizeLabel.textColor = UIColor.white
        plusLabel.textColor = UIColor.white
        equalToLabel.textColor = UIColor.white
        tipAmountLabel.textColor = UIColor.white
        totalAmountLabel.textColor = UIColor.white
        perPersonAmountLabel.textColor = UIColor.white
        partyLabel.textColor = UIColor.white
        partySizeStepper.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.black
    }
    func nightModeTurnOff() {
           billAmountTextField.textColor = UIColor.black
        billAmountTextField.attributedPlaceholder = NSAttributedString(string: "$",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
           tipPercentSelector.tintColor = UIColor.black
           partySizeLabel.textColor = UIColor.black
           plusLabel.textColor = UIColor.black
           equalToLabel.textColor = UIColor.black
           tipAmountLabel.textColor = UIColor.black
           totalAmountLabel.textColor = UIColor.black
           perPersonAmountLabel.textColor = UIColor.black
           partyLabel.textColor = UIColor.black
           partySizeStepper.tintColor = UIColor.black
           self.view.backgroundColor = UIColor.white
       }
    
    func reloadDefaultTipValues() {
        let tip1 = defaults.string(forKey: "tip1") ?? "10%"
        tipPercentSelector.setTitle(tip1, forSegmentAt: 0)
        
        let tip2 = defaults.string(forKey: "tip2") ?? "15%"
        tipPercentSelector.setTitle(tip2, forSegmentAt: 1)
        
        let tip3 = defaults.string(forKey: "tip3") ?? "20%"
        tipPercentSelector.setTitle(tip3, forSegmentAt: 2)
    }
    
    func reloadDisplayedData() {
        var tipAmount = Float()
        var totalAmount = Float()
        var perPersonAmount = Float()
        let partySize = Float(partySizeLabel.text!)
        let billAmount = Float(billAmountTextField.text!)
        var tipPercent = Float()
        var tipPercentSelected = tipPercentSelector.titleForSegment(at: tipPercentSelector.selectedSegmentIndex) as String?
        tipPercentSelected?.removeLast()
        tipPercent = Float(tipPercentSelected!)!

        if billAmount != nil {
            tipAmount = (billAmount! * tipPercent) / 100
            tipAmountLabel.text = "$" + String(tipAmount)
            totalAmount = billAmount! + tipAmount
            perPersonAmount = totalAmount / partySize!
            totalAmountLabel.text = "$" + String(totalAmount)
            perPersonAmountLabel.text = "$" + String(perPersonAmount) + " " + "per person"
        }else{
            tipAmountLabel.text = ""
            totalAmountLabel.text = ""
            perPersonAmountLabel.text = ""
        }
    }
    
    @IBAction func didChangeTipPercent(_ sender: UISegmentedControl) {
        reloadDisplayedData()
    }
    
    @IBAction func partySizeChanged(_ sender: UIStepper) {
        partySizeLabel.text = String(Int(sender.value))
        reloadDisplayedData()
    }
    @IBAction func didBillAmountEntered(_ sender: UITextField) {
        reloadDisplayedData()
    }
}
