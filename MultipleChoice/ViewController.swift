//
//  ViewController.swift
//  MultipleChoice
//
//  Created by Li, Muchen on 2019-12-03.
//  Copyright © 2019 Li, Muchen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberOfQuestions: UITextField!
    @IBOutlet weak var studentAnswerString: UITextField!
    @IBOutlet weak var correctAnswerString: UITextField!
    @IBOutlet weak var outputResult: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkAnswer(_ sender: Any) {
        
        //clear out the ourput label from the last time
        outputResult.text = ""
        
        //guard against empty value for number of questions
        guard let numberInput = numberOfQuestions.text, !numberInput.isEmpty, let number = Int(numberInput) else {
            outputResult.text = "Please enter an integer value greater than 1."
            return
        }
        
        //guard against wrong input for student answer
        guard let studentAnswer = studentAnswerString.text, studentAnswer.count == number else{
            outputResult.text = "Please be sure you input exactly \(numberInput) student answers"
            return
        }
        
        //guard against wrong input for correct answer
        guard let correctAnswer = correctAnswerString.text, correctAnswer.count == number else{
            outputResult.text = "Please be sure you input exactly \(numberInput) for the answer key"
            return
        }
        
        //give output
        analyze()
    }
    
    func analyze(){
        
    }
}

