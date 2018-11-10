//
//  ViewController.swift
//  Peter_Homework6-2
//
//  Created by 陳庭楷 on 2018/11/7.
//  Copyright © 2018年 陳庭楷. All rights reserved.
//
import UIKit

import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var peepLabel: UILabel!
    
    @IBOutlet weak var sendButton: UIButton!
    
    var array = [ "0" , "1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9" ]
    
    var topic : [String] = []
    
    var turnTopic : String = ""
    
    var a = 0
    
    var b = 0
    
    @IBAction func peepDown(_ sender: Any) {
        
        self.peepLabel.isHidden = false
        
    }
    
    @IBAction func peepInside(_ sender: Any) {
        
        self.peepLabel.isHidden = true
        
    }
    
    @IBAction func peepOutside(_ sender: Any) {
        
        self.peepLabel.isHidden = true
        
    }
    
    @IBAction func send(_ sender: Any) {
       
        let turnInput = self.inputTextField.text!
        
        let differentInput = Set(turnInput)
        
        guard differentInput.count == 4 else {
            
            let alert = UIAlertController(title: "請輸入四位數不同的數字", message: nil, preferredStyle: .alert)
            
            let action_Ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alert.addAction(action_Ok)
            
            self.present(alert , animated: true , completion: nil )
            
            return }
        
        guard turnInput.count == self.turnTopic.count else {
            
            let alert = UIAlertController(title: "請輸入四位數的數字", message: nil, preferredStyle: .alert)
            
            let action_Ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alert.addAction(action_Ok)
            
            self.present(alert , animated: true , completion: nil)
            
            return }
        
        for (turnTopicIndex , x) in self.turnTopic.enumerated() {
            
            for (turnInputIndex , y) in turnInput.enumerated() {
                
                if turnTopicIndex == turnInputIndex && x == y {
                    
                    self.a += 1
                    
                }
                    
                else if x == y {
                    
                    self.b += 1
                    
                }
                
            }
            
        }
        
        if a == 4 && b == 0 {
            
            self.displayLabel.text = "恭喜答對囉"
            
            self.sendButton.isEnabled = false
            
        }
        
        else {
            
            self.displayLabel.text = "\(a)A\(b)B"
            
        }
        
        a = 0
        
        b = 0
        
    }
    
    @IBAction func again(_ sender: Any) {
        
        randomPicture()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomPicture()
        
        }
    
    func randomPicture () {
        
        self.topic.removeAll()
        
        let random = GKShuffledDistribution(lowestValue: 0, highestValue: self.array.count-1)
        
        for _ in 1...4 {
            
            let randomNumber = random.nextInt()
            
            let arrayNumber = self.array[randomNumber]
            
            self.topic.append(arrayNumber)
            
        }
        
        self.turnTopic = self.topic.joined(separator: "")
        
        self.peepLabel.text = turnTopic
        
        self.peepLabel.isHidden = true
        
        self .displayLabel.text = "快來猜猜看"
        
        self.sendButton.isEnabled = true
        
    }
        
}
