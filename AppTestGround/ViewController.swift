//
//  ViewController.swift
//  AppTestGround
//
//  Created by user on 14/06/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelResultOutlet: UILabel!
    @IBOutlet weak var labelInputOutlet: UILabel!
    
    
    @IBAction func buttonZeroAction(_ sender: UIButton) {
        if let x = labelInputOutlet.text {
            let a = [Character](x)
            if !a.isEmpty && a[a.count-1] != Character(" ") {
                labelInputOutlet.text = x + "0"
            }
        }
    }
    
    @IBAction func buttonOneAction(_ sender: UIButton) {
        if let x = labelInputOutlet.text {
            labelInputOutlet.text = x + "1"
        } else {
            labelInputOutlet.text = "1"
        }
    }
    
    @IBAction func buttonTwoAction(_ sender: UIButton) {
        if let x = labelInputOutlet.text {
            labelInputOutlet.text = x + "2"
        } else {
            labelInputOutlet.text = "2"
        }
    }
    
    @IBAction func buttonThreeAction(_ sender: UIButton) {
        if let x = labelInputOutlet.text {
            labelInputOutlet.text = x + "3"
        } else {
            labelInputOutlet.text = "3"
        }
    }
    
    @IBAction func buttonFourAction(_ sender: UIButton) {
        if let x = labelInputOutlet.text {
            labelInputOutlet.text = x + "4"
        } else {
            labelInputOutlet.text = "4"
        }
    }
    
    @IBAction func buttonFiveAction(_ sender: UIButton) {
        if let x = labelInputOutlet.text {
            labelInputOutlet.text = x + "5"
        } else {
            labelInputOutlet.text = "5"
        }
    }
    
    @IBAction func buttonSixAction(_ sender: UIButton) {
        if let x = labelInputOutlet.text {
            labelInputOutlet.text = x + "6"
        } else {
            labelInputOutlet.text = "6"
        }
    }
    
    @IBAction func buttonSevenAction(_ sender: UIButton) {
        if let x = labelInputOutlet.text {
            labelInputOutlet.text = x + "7"
        } else {
            labelInputOutlet.text = "7"
        }
    }
    
    @IBAction func buttonEightAction(_ sender: UIButton) {
        if let x = labelInputOutlet.text {
            labelInputOutlet.text = x + "8"
        } else {
            labelInputOutlet.text = "8"
        }
    }
    
    @IBAction func buttonNineAction(_ sender: UIButton) {
        if let x = labelInputOutlet.text {
            labelInputOutlet.text = x + "9"
        } else {
            labelInputOutlet.text = "9"
        }
    }
    
    @IBAction func buttonPlusAction(_ sender: UIButton) {
        if let x = labelInputOutlet.text {
            let a = [Character](x)
            if !a.isEmpty && a[a.count-1] != Character(" ") {
                labelInputOutlet.text = x + " + "
            }
        }
    }
    
    @IBAction func buttonMinusAction(_ sender: UIButton) {
        if let x = labelInputOutlet.text {
            let a = [Character](x)
            if !a.isEmpty && a[a.count-1] != Character(" ") {
                labelInputOutlet.text = x + " - "
            }
        }
    }
    
    @IBAction func buttonMultiplyAction(_ sender: UIButton) {
        if let x = labelInputOutlet.text {
            let a = [Character](x)
            if !a.isEmpty && a[a.count-1] != Character(" ") {
                labelInputOutlet.text = x + " * "
            }
        }
    }
    
    @IBAction func buttonDivideAction(_ sender: UIButton) {
        if let x = labelInputOutlet.text {
            let a = [Character](x)
            if !a.isEmpty && a[a.count-1] != Character(" ") {
                labelInputOutlet.text = x + " / "
            }
        }
    }
    
    @IBAction func buttonCalculateAction(_ sender: UIButton) {
        labelResultOutlet.text = calculateResult(labelInputOutlet.text!)
        labelInputOutlet.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


func calculateResult(_ input: String) -> String {
    let listedInput = input.split(separator: " ")
    var firstOperations = listedInput
    
    outerloop: for _ in 0..<firstOperations.count {
        innerloop: for y in 0..<firstOperations.count {
            if firstOperations[y] == "*" {
                print("\(firstOperations[y+1]) - \(y)")
                let temp = String(Int(firstOperations[y-1])! * Int(firstOperations[y+1])!)
                firstOperations.remove(at: y+1)
                firstOperations.remove(at: y)
                firstOperations.remove(at: y-1)
                firstOperations.insert(String.SubSequence(temp), at: y-1)
                break innerloop
            } else if firstOperations[y] == "/" {
                let temp = String(Int(Int(firstOperations[y-1])! / Int(firstOperations[y+1])!))
                print(temp)
                print(firstOperations)
                firstOperations.remove(at: y+1)
                firstOperations.remove(at: y)
                firstOperations.remove(at: y-1)
                firstOperations.insert(String.SubSequence(temp), at: y-1)
                print(firstOperations)
                break innerloop
            }
        }
    }
    
    if firstOperations.count == 1 {
        return String(firstOperations[0])
    }
    
    var operation: Int = 0
    var result: Int = Int(firstOperations[0])!
    
    
    for x in 0..<firstOperations.count {
        switch firstOperations[x] {
        case "+":
            operation = 1
        case "-":
            operation = 2
        default:
            if operation == 1 {
                result += Int(firstOperations[x])!
            } else if operation == 2 {
                result -= Int(firstOperations[x])!
            }
        }
    }
    
    return String(result)
}
