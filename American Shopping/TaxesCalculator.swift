//
//  TaxesCalculator.swift
//  American Shopping
//
//  Created by Bruno Silva on 01/07/20.
//  Copyright © 2020 Bruno Alves da Silva. All rights reserved.
//

import Foundation

class TaxesCalculator {
    
    // Criando um Singleton
    static let shared = TaxesCalculator()
    
    // Variaveis
    var dolar: Double = 5.31
    var iof: Double = 6.38
    var stateTax: Double = 7.0
    var shoppingValue: Double = 0
    
    let formatter = NumberFormatter()
    
    // Variavel computada
    var shoppingValueInReal: Double {
        return shoppingValue * dolar
    }
    
    var stateTaxValue: Double {
        return shoppingValue * stateTax/100
    }
    
    var iofValue: Double {
        return (shoppingValue + stateTax) * iof/100
    }
    
    func calculate(usingCreditCard: Bool) -> Double {
        var finalValue = shoppingValue + stateTaxValue
        if usingCreditCard {
            finalValue += iofValue
        }
        return finalValue * dolar
    }
    
    func getFormattedValue(of value: Double, withCurrency currency: String) -> String {
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(for: value)!
    }
    
    func convertToDouble(_ string: String) -> Double {
        formatter.numberStyle = .none
        return formatter.number(from: string)!.doubleValue
    }
    
    // Criando um construtor privado
    private init () {
        formatter.usesGroupingSeparator = true
    }
}
