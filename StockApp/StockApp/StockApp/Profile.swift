//
//  Profile.swift
//  StockApp
//
//  Created by Xinhao Jing on 11/5/20.
//

import Foundation

class Profile {
    var symbol : String! = ""
    var price : Double = 0.0
    var ceo : String = ""
    
    
    init(symbol : String!, price : Double, ceo : String) {
        self.symbol = symbol
        self.price = price
        self.ceo = ceo
    }
}
