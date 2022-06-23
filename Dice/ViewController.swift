//
//  ViewController.swift
//  Dice
//
//  Created by Swantan Barua on 22/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player1Status: UIImageView!
    @IBOutlet weak var player2Status: UIImageView!
    
    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    var flag = false
    var player1Points: Int = 0
    var player2Points: Int = 0
    
    let diceImageValues = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        if !flag{
            let score: Int = Int.random(in: 0...5)
            diceImageView1.image = UIImage(named: diceImageValues[score])
            player1Points += (score + 1)
            player1Score.text = String(player1Points)
            player1Status.image = UIImage(named: "Off")
            player2Status.image = UIImage(named: "On")
            diceImageView1.layer.opacity = 0.2
            diceImageView2.layer.opacity = 1.0
        }
        
        else{
            let score: Int = Int.random(in: 0...5)
            diceImageView2.image = UIImage(named: diceImageValues[score])
            player2Points += (score + 1)
            player2Score.text = String(player2Points)
            player1Status.image = UIImage(named: "On")
            player2Status.image = UIImage(named: "Off")
            diceImageView1.layer.opacity = 1.0
            diceImageView2.layer.opacity = 0.2
        }
        
        flag = !flag
    }
}
