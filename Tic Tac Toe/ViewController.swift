//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Dharmesh Tarapore on /19/215.
//  Copyright (c) 2015 Sharpwit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var xTurn:Bool = true

    @IBOutlet var buttons: [UIButton]!
    var board = [0,0,0,0,0,0,0,0,0]
    
    
    @IBOutlet var pegs: [UIButton]!
    
    
    @IBAction func newGame(sender: AnyObject) {
        
        for(var i = 0; i < board.count; i++) {
            board[i] = 0
            pegs[i].setImage(UIImage(), forState: .Normal)
        }
        
    }
    
    func isBoardFull() -> Bool {
        for(var i = 0; i < board.count; i++) {
            if(board[i] == 0) {
                return false
            }
        }
        // We know it's full if it gets here
        return true
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        if(xTurn) {
            if(board[sender.tag] == 0) {
                var image = UIImage(named: "cross.png")
                sender.setImage(image, forState: .Normal)
                board[sender.tag] = 1
                xTurn = !xTurn
                if(isWinFor(1)) {
                    UIAlertView(title:"X Wins!", message:"Player X won!", delegate:"newGame()", cancelButtonTitle:"Okay").show()
                    endGame()
                } else if(isBoardFull()) {
                    UIAlertView(title:"Tie", message:"It's a tie!", delegate:"newGame()", cancelButtonTitle:"Okay").show()
                    endGame()
                }
                
            }
        } else {
            if(board[sender.tag] == 0) {
                var image = UIImage(named: "nought.jpg")
                sender.setImage(image, forState: .Normal)
                board[sender.tag] = 2
                xTurn = !xTurn
                if(isWinFor(2)) {
                    UIAlertView(title:"O Wins!", message:"Player O won!", delegate:"newGame()", cancelButtonTitle:"Okay").show()
                    endGame()
                } else if(isBoardFull()) {
                    UIAlertView(title:"Tie", message:"It's a tie!", delegate:"newGame()", cancelButtonTitle:"Okay").show()
                    endGame()
                }
            
        }
        //xTurn = !xTurn
    }
}
    func endGame() {
        for(var i = 0; i < board.count; i++) {
            if(board[i] == 0) {
                board[i] = 9
            }
        }
    }
    func isWinFor(player: Int) -> Bool {
        
        var isHorizontalWin0 = ((board[0] == player && board[1] == player && board[2] == player))
            
        var isHorizontalWin1 = ((board[3] == player && board[4] == player && board[5] == player) || (board[6] == player && board[7] == player && board[8] == player))
        
        var isHorizontalWin = (isHorizontalWin0 || isHorizontalWin1)
        
        var isVerticalWin0 = ((board[0] == player && board[3] == player && board[6] == player) || (board[1] == player && board[4] == player && board[7] == player))
        
        var isVerticalWin1 = (board[2] == player && board[5] == player && board[8] == player)
        
        var isVerticalWin = (isVerticalWin0 || isVerticalWin1)
        
        var isDiagonalWin = ((board[0] == player && board[4] == player && board[8] == player) || (board[2] == player && board[4] == player && board[6] == player))
        
        if((isHorizontalWin) || (isVerticalWin) || (isDiagonalWin)) {
            return true
    
        }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


