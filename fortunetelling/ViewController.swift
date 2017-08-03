//
//  ViewController.swift
//  fortunetelling
//
//  Created by MEI KU on 2017/7/30.
//  Copyright © 2017年 Natalie KU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fortuneteller: UIImageView!
    @IBOutlet weak var responseLabel: UILabel!
    
    @IBOutlet weak var myYear: UILabel!
    @IBOutlet weak var questionField: UITextField!
    
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var yearOld: UILabel!
    
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var askButton: UIButton!
    
    
    
    var MyYearValue:Int = 0
    
    @IBAction func yearOldSlider(_ sender: UISlider) {
        myYear.isHidden = false
        MyYearValue = Int(sender.value)
        myYear.text = "\(MyYearValue)歲"
    }
    
    let questionAnswerer = MyQuestionAnswerer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionField.becomeFirstResponder()
    }
    
    func respondToQuestion(_ question: String) {
        let answer = questionAnswerer.responseTo(question: question)
        
        displayAnswerTextOnScreen(answer)
        questionField.placeholder = "不準... 再測.. "
        questionField.text = nil
        askButton.isEnabled = false
    }
    
    @IBAction func askButtonTapped(_ sender: AnyObject) {
        guard questionField.text != nil else {
            return
        }
        questionField.resignFirstResponder()
    }
    
    func displayAnswerTextOnScreen(_ answer: String) {
        responseLabel.text = answer
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        
        respondToQuestion(text)
    }
    
    @IBAction func editingChanged(_ textField: UITextField) {
        guard let text = textField.text else {
            askButton.isEnabled = false
            return
        }
        
        askButton.isEnabled = !text.isEmpty
    }
}

