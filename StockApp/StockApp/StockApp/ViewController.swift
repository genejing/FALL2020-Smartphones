//
//  ViewController.swift
//  StockApp
//
//  Created by Xinhao Jing on 11/5/20.
//

import UIKit

import SwiftyJSON
import SwiftSpinner
import Alamofire

class ViewController: UIViewController {
    
    
    let apiKey = "453afbda6137668392ee97668abeb8a4"
    
    let apiURL = "https://financialmodelingprep.com/api/v3/profile/"

   
    @IBOutlet weak var lblSymbol: UILabel!
    
    @IBOutlet weak var txtSymbol: UITextField!
    
    
    @IBOutlet weak var lblCEO: UILabel!
    
    
    @IBOutlet weak var txtCEO: UITextField!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var txtPrice: UITextField!
    
    
    
    @IBAction func getValue(_ sender: Any) {
        
        guard let symbolName = txtSymbol.text else {return}
        
        let url = "\(apiURL)\(symbolName)?apikey=\(apiKey)"
        
        getStockValue(stockURL : url, symbolName : symbolName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getStockValue(stockURL: String!, symbolName: String!) {
        
        SwiftSpinner.show("getting value for \(symbolName)")
        AF.request(stockURL).responseJSON { (response) in
            SwiftSpinner.hide()
            guard let jsonString = response.data else {return}
            guard let profile:[JSON] = JSON(jsonString).array else {return}
            
            if (profile.count < 1) {return}
            
            guard let price = profile[0]["price"].double else {return}
            guard let ceo = profile[0]["ceo"].rawString() else {return}
            
            self.txtPrice.text = String(price)
            self.txtCEO.text = ceo

            
        }
        
    }


}

