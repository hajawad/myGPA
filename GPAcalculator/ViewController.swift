//
//  ViewController.swift
//  GPAcalculator
//
//  Created by AlJawad, Hashim on 3/3/17.
//  Copyright © 2017 AlJawad, Hashim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    /* Number of Credits Fields */
    @IBOutlet weak var num_of_credits1: UITextField!
    @IBOutlet weak var num_of_credits2: UITextField!
    @IBOutlet weak var num_of_credits3: UITextField!
    @IBOutlet weak var num_of_credits4: UITextField!
    @IBOutlet weak var num_of_credits5: UITextField!
    @IBOutlet weak var num_of_credits6: UITextField!
    
    /* Grade Fields */
    @IBOutlet weak var course_grade1: UITextField!
    @IBOutlet weak var course_grade2: UITextField!
    @IBOutlet weak var course_grade3: UITextField!
    @IBOutlet weak var course_grade4: UITextField!
    @IBOutlet weak var course_grade5: UITextField!
    @IBOutlet weak var course_grade6: UITextField!
    
    
    @IBOutlet weak var myGPA: UITextField!
    

    var grades: [Double]!
    var course_grades: [String]!
    var numOfCredits: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func convertLetterGradeToPoint(letterGrade: [String]) -> [Double] {
        grades = []
        for i in letterGrade {
            switch i {
                case "A":
                    grades.append(4.00)
                case "A-":
                    grades.append(3.7)
                case "B+":
                    grades.append(3.3)
                case "B":
                    grades.append(3.0)
                case "B-":
                    grades.append(2.7)
                case "C+":
                    grades.append(2.3)
                case "C":
                    grades.append(2.0)
                case "C-":
                    grades.append(1.7)
                case "D+":
                    grades.append(1.3)
                case "D":
                    grades.append(1.0)
                case "D-":
                    grades.append(0.7)
                case "F":
                    grades.append(0.0)
                default:
                    grades.append(0.0)
            }
        }
        return grades;
    }
    
    
    @IBAction func calculateMyGPA(_ sender: UIButton) {
        
        course_grades = [course_grade1.text!,course_grade2.text!,course_grade3.text!,course_grade4.text!,course_grade5.text!,course_grade6.text!]
        numOfCredits = [num_of_credits1.text!,num_of_credits2.text!,num_of_credits3.text!,num_of_credits4.text!,num_of_credits5.text!,num_of_credits6.text!]
        
        grades = convertLetterGradeToPoint(letterGrade: course_grades)
        let sumOfPoints = multiplyPointByNumberOfCredits(numOfCredits: numOfCredits)
        let  sumOfCredits = sumUpNumberOfCredit(numberOfCredits: numOfCredits)
        let myCalculatedGPA = round(1000*(sumOfPoints/sumOfCredits))/1000
        
        myGPA.text = "\(myCalculatedGPA)"
    }
    
    func multiplyPointByNumberOfCredits(numOfCredits: [String]) -> Double {
        
        var sum: Double = 0
        
        for i in 0...(grades.count-1) {
            sum = sum + (grades[i] * (numOfCredits[i] as NSString).doubleValue)
        }
        
        return sum;
    }
    
    func sumUpNumberOfCredit(numberOfCredits: [String]!) -> Double {
        var sum: Double = 0
        
        for index in numOfCredits {
            sum = sum + (index as NSString).doubleValue
        }
        return sum
    }

}

