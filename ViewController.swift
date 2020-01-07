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
    }
    @IBAction func action(_ sender: UIButton) {
    }
    @IBOutlet var buttons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        drowField()
    }

    func drowButtons() {
        
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

