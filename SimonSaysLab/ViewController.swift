//
//  ViewController.swift
//  SimonSaysLab
//
//  Created by James Campagno on 5/31/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var buttonsClicked = 0
    
    @IBAction func redColor(sender: AnyObject) {
        
        if buttonsClicked != 5 {
            
            simonSaysGame.guessRed()
            buttonsClicked = buttonsClicked + 1
            print("red")
            
        } else {
            
            if simonSaysGame.wonGame() == true {
                
                
                winLabel.text = "You won!"
                winLabel.hidden = false
                
            } else {
                
                winLabel.text = "Try again"
                winLabel.hidden = false
                
            }
        }

    }
    
    
    @IBAction func greenColor(sender: AnyObject) {
        
        if buttonsClicked != 5 {
            
            simonSaysGame.guessGreen()
            buttonsClicked = buttonsClicked + 1
            print("green")
            
        } else {
            
            if simonSaysGame.wonGame() == true {
                
                
                winLabel.text = "You won!"
                winLabel.hidden = false
                
            } else {
                
                winLabel.text = "Try again"
                winLabel.hidden = false
                
            }
        }

        
    }
    
    
    @IBAction func yellowColor(sender: AnyObject) {
        
        if buttonsClicked != 5 {
            
            simonSaysGame.guessYellow()
            buttonsClicked = buttonsClicked + 1
            print("yellow")
            
        } else {
            
            if simonSaysGame.wonGame() == true {
                
                
                winLabel.text = "You won!"
                winLabel.hidden = false
                
            } else {
                
                winLabel.text = "Try again"
                winLabel.hidden = false
                
            }
        }

        
    }
    
    
    @IBAction func blueColor(sender: AnyObject) {
        
        if buttonsClicked != 5 {
            
            simonSaysGame.guessBlue()
            buttonsClicked = buttonsClicked + 1
            print("blue")
            
        } else {
            
            if simonSaysGame.wonGame() == true {
                
                
                winLabel.text = "You won!"
                winLabel.hidden = false
                
            } else {
                
                winLabel.text = "Try again"
                winLabel.hidden = false
                
            }
        }

        
    }
    
    @IBOutlet weak var displayColorView: UIView!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var winLabel: UILabel!
    var simonSaysGame = SimonSays()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winLabel.hidden = true

    }
    
}




// MARK: - SimonSays Game Methods
extension ViewController {
    
    @IBAction func startGameTapped(sender: UIButton) {
        UIView.transitionWithView(startGameButton, duration: 0.9, options: UIViewAnimationOptions.CurveEaseIn , animations: {
            self.startGameButton.hidden = true
            }, completion: nil)
        
        displayTheColors()
    }
    
    func displayTheColors() {
        self.view.userInteractionEnabled = false
        UIView.transitionWithView(displayColorView, duration: 1.5, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.displayColorView.backgroundColor = self.simonSaysGame.nextColor()?.colorToDisplay
            self.displayColorView.alpha = 0.0
            self.displayColorView.alpha = 1.0
            }, completion: { _ in
                if !self.simonSaysGame.sequenceFinished() {
                    self.displayTheColors()
                } else {
                    self.view.userInteractionEnabled = true
                    print("Pattern to match: \(self.simonSaysGame.patternToMatch)")
                }
        })
    }
}
