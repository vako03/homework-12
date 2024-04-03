//
//  ViewController.swift
//  homework 12
//
//  Created by vako on 03.04.24.
//
// iPhone 14 Pro-ზე გავტესტე.  ჩემთან 16.2 ბოლო ვერსია

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
        resultButton.layer.cornerRadius = resultButton.frame.height / 2
        updateButtonColor()
    }
    
    
    func updateTxtTitle() {
        textTitle.text = textSwitch.isOn ? "უდიდესი საერთო  გამყოფი" : "უმცირესი საერთო ჯერადი"
    }
    
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        updateTxtTitle()
        updateButtonColor()
        
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        guard let firstText = firstNum.text, !firstText.isEmpty,
              let secondText = secondNum.text, !secondText.isEmpty,
              let firstNumber = Int(firstText),
              let secondNumber = Int(secondText) else {
            answerTxt.text = "შეიყვანეთ რიცხვი"
            
            // Add red border to text fields to indicate invalid input
            if let firstText = firstNum.text, Int(firstText) == nil {
                firstNum.layer.borderColor = UIColor.red.cgColor
                firstNum.layer.borderWidth = 1.0
            }
            if let secondText = secondNum.text, Int(secondText) == nil {
                secondNum.layer.borderColor = UIColor.red.cgColor
                secondNum.layer.borderWidth = 1.0
            }
            return
        }
        
        
        // Remove border from text fields if input is valid
        firstNum.layer.borderWidth = 0
        secondNum.layer.borderWidth = 0
        
        let result: Int
        if textSwitch.isOn {
            result = greatestCommonDivisor(of: abs(firstNumber), and: abs(secondNumber))
        } else {
            result = leastCommonMultiple(of: abs(firstNumber), and: abs(secondNumber))
        }
        
        answerTxt.text = "პასუხი: \(result)"
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
    
    func updateButtonColor() {
        let color: UIColor = textSwitch.isOn ? .orange : .blue
        resultButton.backgroundColor = color
    }
}

