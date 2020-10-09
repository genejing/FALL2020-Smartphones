//
//  ViewController.swift
//  CardGameUI
//
//  Created by Xinhao Jing on 10/8/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player1Img1: UIImageView!
    
    @IBOutlet weak var player1Img2: UIImageView!
    
    @IBOutlet weak var player1Img3: UIImageView!
    
    @IBOutlet weak var player2Img1: UIImageView!
    
    @IBOutlet weak var player2Img2: UIImageView!
    
    @IBOutlet weak var player2Img3: UIImageView!
    
    @IBOutlet weak var lblWinner: UILabel!
    
    var imageData = [ImageClass]()
    
    var colorArray = ["H", "S", "D", "C"]
    var numberArray = ["A", "2", "3","4","5","6", "7", "8","9","10","J", "Q", "K"]
    var colorSet = Set<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playGame(_ sender: Any) {
        
        chooseCard()
        
    }
    
    func chooseCard() {
        lblWinner.text = "No Winner"
        imageData.removeAll()
        colorSet.removeAll()
        for _ in 1...6 {
            var num = numberArray[Int.random(in: 0...12)]
            var color = colorArray[Int.random(in: 0...3)]
            var name = num + color
            while colorSet.contains(name) {
                num = numberArray[Int.random(in: 0...12)]
                color = colorArray[Int.random(in: 0...3)]
                name = num + color
            }
            colorSet.insert(name)
            imageData.append(ImageClass(image: UIImage(named: name)!,  title: name))
        }
        player1Img1.image = imageData[0].image
        player1Img2.image = imageData[1].image
        player1Img3.image = imageData[2].image
        player2Img1.image = imageData[3].image
        player2Img2.image = imageData[4].image
        player2Img3.image = imageData[5].image
        checkWinner()
        if lblWinner.text != "No Winner" {
           alert()
        }
    }
    
   
    
    func checkWinner() {
        for i in 0...5 {
            if imageData[i].title == "AS" {
                if i <= 2 {
                    lblWinner.text = "Winner is Player1"
                } else {
                    lblWinner.text = "Winner is Player2"
                }
                
            }
        }
    }
    
    func alert() {
        guard let text = lblWinner.text else { return }
        let alert = UIAlertController(title: "Play Again", message: text  + ". Do you want to play again?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler:nil))
        self.present(alert, animated: true, completion: nil)
        
        
    }
}

