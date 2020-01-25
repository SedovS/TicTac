//
//  ViewController.swift
//  TicTacToe
//
//  Created by Apple on 07.01.2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fieldView: UIView!
    @IBOutlet weak var fieldImage: UIImageView!
    @IBOutlet weak var playerOne: UITextField!
    @IBOutlet weak var playerTwo: UITextField!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var countWinFirstLabel: UILabel!
    @IBOutlet weak var countWinSecondLabel: UILabel!
    
    @IBAction func newGame(_ sender: UIButton) {
        newGame()
    }
    @IBAction func action(_ sender: UIButton) {
        actions(sender)
    }
    @IBOutlet var buttons: [UIButton]!
    
    var activePlayer = 1
    var gameActive = true
    var gameState: [Int] = [0,0,0, 0,0,0, 0,0,0]
    var winsFirst = 0
    var winsSecond = 0
    var numbersMoves = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newGameButton.isHidden = true
        winnerLabel.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        drowField()
    }
    
    func actions(_ sender: UIButton) {
        if (gameState[sender.tag-1] == 0 && gameActive){
            
            if (activePlayer == 1 ) {
                gameState[sender.tag-1] = activePlayer
                sender.setBackgroundImage(UIImage(named: "X"), for: .normal)
                sender.isEnabled = false
                if winCombination(){
                    gameActive = false
                    winsFirst += 1
                    countWinFirstLabel.textColor = .red
                    helpWinnerLabel(text: "Победил \(playerOne.text ?? "первый игрок")")
                }
                activePlayer = 2
                numbersMoves += 1
            }
            else {
                gameState[sender.tag-1] = activePlayer
                sender.setBackgroundImage(UIImage(named: "0"), for: .normal)
                sender.isEnabled = false
                if winCombination(){
                    gameActive = false
                    winsSecond += 1
                    countWinSecondLabel.textColor = .red
                    helpWinnerLabel(text: "Победил \(playerTwo.text ?? "второй игрок")")
                }
                activePlayer = 1
                numbersMoves += 1
            }
            
            if (numbersMoves == 9 && !winCombination())
            {
                helpWinnerLabel(text: "Ничья!")
            }
        }
    }
    
    func helpWinnerLabel(text: String) {
        winnerLabel.isHidden = false
        winnerLabel.text = text
        newGameButton.isHidden = false
    }
    
    func winCombination() -> Bool{
        let winningCombination = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
        for comb in winningCombination{
            if gameState[comb[0]] != 0 && gameState[comb[0]] == gameState[comb[1]] && gameState[comb[1]] == gameState[comb[2]]{
                for i in comb {
                    let button = buttons[i]
                    button.isEnabled = true
                }
                return true
            }
        }
        return false
    }
    
    func newGame() {
        activePlayer = 1
        gameActive = true
        gameState = [0,0,0, 0,0,0, 0,0,0]
        numbersMoves = 0
        
        countWinSecondLabel.text = String(winsSecond)
        countWinFirstLabel.text = String(winsFirst)
        countWinFirstLabel.textColor = .black
        countWinSecondLabel.textColor = .black
        winnerLabel.text = ""
        winnerLabel.isHidden = true
        newGameButton.isHidden = true
        
        for button in buttons {
            button.setBackgroundImage(nil, for: .normal)
            button.isEnabled = true
        }
    }

    func drowField() {
        
        let border = CGFloat(6)
        
        let height = view.frame.size.width
        let width = view.frame.size.width
        let sizeButton = (width/3 - border/2)
        
        var x = CGFloat(0)
        var y = CGFloat(0)
        
        //Отрисовка горизовтальных полосок
        for i in 1...2 {
            let view = UIView()
            view.backgroundColor = .black
            view.frame = CGRect(x: (width/3*CGFloat(i) - border/2) , y: 0, width: border, height: height)
            fieldView.addSubview(view)
        }
        //Отрисовка вертикальных полосок
        for i in 1...2 {
            let view = UIView()
            view.backgroundColor = .black
            view.frame = CGRect(x: 0 , y: (height/3*CGFloat(i) - border/2), width: width, height: border)
            fieldView.addSubview(view)
        }


        buttons.sort { $0.tag < $1.tag }
        //Координаты кнопкам
        for button in buttons {
            if button.tag == 4 || button.tag == 7 {
                x = CGFloat(0)
                y += sizeButton + border
            }
            
            button.frame = CGRect(x: x, y: y, width: sizeButton, height: sizeButton)
            x += sizeButton + border
        }
    }
    
    //Убирание клавиатуры по нажатию на пустую часть экрана
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil{
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
}

