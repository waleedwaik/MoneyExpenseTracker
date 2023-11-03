//
//  ViewController.swift
//  Savings_Calculator
//
//  Created by Abdallah Mahameed on 1/13/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var goodText: UITextField!
    @IBOutlet weak var transText: UITextField!
    @IBOutlet weak var foodText: UITextField!
    @IBOutlet weak var rentText: UITextField!
    @IBOutlet weak var billsText: UITextField!
    @IBOutlet weak var salaryText: UITextField!
    @IBOutlet weak var savedText: UITextField!
    

    @IBAction func calcButton(_ sender: UIButton) {
        
        savedText.text = ""
        guard validateInputs() else { return }
        
        let s1 = Float(goodText.text!)!
        let s2 = Float(transText.text!)!
        let s3 = Float(foodText.text!)!
        let s4 = Float(rentText.text!)!
        let s5 = Float(billsText.text!)!
        let s6 = Float(salaryText.text!)!
        let calcResult = s6 - (s1+s2+s3+s4+s5)
        savedText.text = "\(calcResult)"
        
        if calcResult >= 200 {
            showAlert(title: "Fabuilous!", message: " You have saved a lot")
        }
        else if calcResult > 0 && calcResult < 200 {
            showAlert(title: "Good", message: "You Could have done better")
        }
        else{
            showAlert(title: "Bad News", message: "Your salary doesn't cover4 your needs")
        }
    }
    
    

    private func validateInputs() -> Bool {
        
        guard let text1 = transText.text, !text1.isEmpty, let value1 = Float(text1), value1 >= 0
        else {
            showAlert(message: "Please Fill Transportation Field")
            return false
        }
        
        guard let text2 = foodText.text, !text2.isEmpty, let value2 = Float(text2), value2 >= 0
        else {
            showAlert(message: "Please Fill Food Field")
            return false
        }
        
        guard let text = goodText.text, !text.isEmpty, let value = Float(text), value >= 0
        else {
            showAlert(message: "Please Fill Good Field")
            return false
        }
        
        
        guard let text3 = rentText.text, !text3.isEmpty, let value3 = Float(text3), value3 >= 0
        else {
            showAlert(message: "Please Fill Rent Field")
            return false
        }
        
        guard let text4 = billsText.text, !text4.isEmpty, let value4 = Float(text4), value4 >= 0
        else {
            showAlert(message: "Please Fill Bill Field")
            return false
        }
        
        guard let text5 = salaryText.text, !text5.isEmpty, let value5 = Float(text5), value5 > 0
        else {
            showAlert(message: "Please Fill Salary Field")
            return false
        }
        return true
        
    }
    
    
    
    private func showAlert(title: String = "Error", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

