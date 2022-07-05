//
//  ViewController.swift
//  Dice
//
//  Created by Swantan Barua on 22/06/22.
//

import UIKit

class DiceGameController: UIViewController {

    @IBOutlet weak var player1Status: UIImageView!
    @IBOutlet weak var player2Status: UIImageView!
    
    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    var winner: String = ""
    var flag = false
    var player1Points: Int = 0
    var player2Points: Int = 0
    
    let diceImageValues = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool){
        
        super.viewWillAppear(animated)
        player1Status.image = UIImage(named: "On")
        player2Status.image = UIImage(named: "Off")
        player1Points = 0
        player2Points = 0
        flag = false
        player1Score.text = String(player1Points)
        player2Score.text = String(player2Points)
        diceImageView1.image = UIImage(named: diceImageValues[0])
        diceImageView2.image = UIImage(named: diceImageValues[0])
        diceImageView1.layer.opacity = 1.0
        diceImageView2.layer.opacity = 1.0
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
            if player1Points >= 100{
                winner = "Player 1"
                performSegue(withIdentifier: "goToResult", sender: self)
            }
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
            if player2Points >= 100{
                winner = "Player 2"
                performSegue(withIdentifier: "goToResult", sender: self)
            }
        }
        
        flag = !flag
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! WinnerController
            destinationVC.winner = winner
        }
    }
}
