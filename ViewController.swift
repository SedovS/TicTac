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
    @IBOutlet weak var counrWinSecondLabel: UILabel!
    @IBAction func newGame(_ sender: UIButton) {
    }
    @IBAction func action(_ sender: UIButton) {
    }
    @IBOutlet var buttons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        drowButtons()
    }

    func drowButtons() {
        
        let border = CGFloat(5)
        let left = CGFloat(8)
        let up = CGFloat(2)
        
        let height = (view.frame.size.width - 2*(up) - 2*(border)) / 3
        let width = (view.frame.size.width - 2*(left) - 2*(border)) / 3
        
        var x = left
        var y = up
        
        buttons.sort { $0.tag < $1.tag }
        
        for button in buttons {
            if button.tag == 4 || button.tag == 7 {
                x = left
                y += height + border
            }
            
            button.frame = CGRect(x: x, y: y, width: width, height: height)
            x += width + border
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

