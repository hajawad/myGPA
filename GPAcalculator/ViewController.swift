//
//  ViewController.swift
//  GPAcalculator
//
//  Created by AlJawad, Hashim on 3/3/17.
//  Copyright © 2017 AlJawad, Hashim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate{
    @IBOutlet weak var grade_field1: UITextField!
    @IBOutlet weak var pickerView1: UIPickerView!
    
    var grades = ["A","A-","B+","B","B-","C+","C","C-","D+","D","D-","F"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView1 = UIPickerView();
        pickerView1.delegate = self;
        
        self.grade_field1.inputView = self.pickerView1;
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int  {
        return 1
    }
    
    private func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return grades.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        return grades[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        
        grade_field1.text = grades[row]

    }

}

