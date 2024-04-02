//
//  ViewController.swift
//  homework 12
//
//  Created by vako on 03.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textTitle: UILabel!
    @IBOutlet weak var textSwitch: UISwitch!
    @IBOutlet weak var firstNum: UITextField!
    @IBOutlet weak var secondNum: UITextField!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var answerTxt: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textSwitch.isOn = false
        resultButton.layer.cornerRadius = resultButton.frame.height / 4

    }
    
    func updateTxtTitle() {
        
        textTitle.text = textSwitch.isOn ? "უდიდესი საერთო  გამყოფი" : "უდიდესი საერთო ჯერადი"
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        updateTxtTitle()
        
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        guard let firstText = firstNum.text, let secondText = secondNum.text,
                      let firstNumber = Int(firstText), let secondNumber = Int(secondText),
                      firstNumber != 0, secondNumber != 0 else {
                    answerTxt.text = "ნულზე გაყოფა თქვენკენ მოიკითხეთ"
                    return
                }
                
                let result: Int
                if textSwitch.isOn {
                    result = greatestCommonDivisor(of: abs(firstNumber), and: abs(secondNumber))
                } else {
                    result = leastCommonMultiple(of: abs(firstNumber), and: abs(secondNumber))
                }
                
                answerTxt.text = "Result: \(result)"
            }
            
            func greatestCommonDivisor(of a: Int, and b: Int) -> Int {
                var a = a, b = b
                while b != 0 {
                    let temp = b
                    b = a % b
                    a = temp
                }
                return abs(a)
            }
            
            func leastCommonMultiple(of a: Int, and b: Int) -> Int {
                return (a * b) / greatestCommonDivisor(of: a, and: b)
            }
        }
