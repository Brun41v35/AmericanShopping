//
//  TaxesViewController.swift
//  American Shopping
//
//  Created by Bruno Alves da Silva on 30/06/20.
//  Copyright © 2020 Bruno Alves da Silva. All rights reserved.
//

import UIKit

class TaxesViewController: UIViewController {

    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbStateTexDescription: UILabel!
    @IBOutlet weak var lbStateTex: UILabel!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeIOF(_ sender: Any) {
        calculateTaxes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        calculateTaxes()
    }
    
    func calculateTaxes() {
        lbStateTexDescription.text = "Imposto do Estado (\(tc.getFormattedValue(of: tc.stateTax, withCurrency: ""))%)"
        lbStateTexDescription.text = "IOF (\(tc.getFormattedValue(of: tc.iof, withCurrency: ""))%)"
        
        lbDolar.text = tc.getFormattedValue(of: tc.shoppingValue, withCurrency: "US$")
        lbStateTex.text = tc.getFormattedValue(of: tc.stateTaxValue, withCurrency: "US$")
        lbIOF.text = tc.getFormattedValue(of: tc.iofValue, withCurrency: "US$")
        
        let real = tc.calculate(usingCreditCard: swCreditCard.isOn)
        lbReal.text = tc.getFormattedValue(of: real, withCurrency: "R$ ")
    }
}
