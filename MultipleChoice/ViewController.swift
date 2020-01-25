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
        
        let possibleAnswer = "ABCDE"
        
        //check for characters other than ABCDE in student answer
        for checkEachStudentAnswer in studentAnswer{
            guard possibleAnswer.contains(checkEachStudentAnswer) else {
                outputResult.text = "Student answers contains invalid choices. Please ensure that only characters A, B, C, D, E are ever used."
                return
            }
        }
        //check for characters other than ABCDE in correct answer
        for checkEachCorrectAnser in correctAnswer{
            guard possibleAnswer.contains(checkEachCorrectAnser) else {
                outputResult.text = "Correct answers contains invalid choices. Please ensure that only characters A, B, C, D, E are ever used."
                return
            }
        }
        
        //set the index as -1
        var index = -1
        
        //set the correct answer right now as 0
        var correctAnwserNumber = 0
        
        //literate over each character in student answer and check if the character is the same as the character in the same position in correct answer
        for eachStudentAnswer in studentAnswer{
            
            //increase the index by 1
            index += 1
            
            //get the character in the correct answer for the same position as student answer
            let theNthCorrectAnswer = correctAnswer.index(correctAnswer.startIndex, offsetBy: index)
            
            //check if the student answer equals the correct answer
            if eachStudentAnswer == correctAnswer[theNthCorrectAnswer]{
                correctAnwserNumber += 1
            }else{
                correctAnwserNumber += 0
            }
        }
        
        //print out the result
        outputResult.text = "The student got \(correctAnwserNumber) questions correctly"
    }
}

