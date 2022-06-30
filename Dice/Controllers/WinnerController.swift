//
//  WinnerController.swift
//  Dice
//
//  Created by Swantan Barua on 30/06/22.
//

import UIKit

class WinnerController: UIViewController {

    var winner: String?
    
    @IBOutlet weak var winnerName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        winnerName.text = winner
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func playAgain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
