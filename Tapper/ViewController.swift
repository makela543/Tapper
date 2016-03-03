//
//  ViewController.swift
//  Tapper
//
//  Created by Mark Laukkanen on 03/03/16.
//  Copyright © 2016 Mark Laukkanen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //Properties
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapLbl: UILabel!
    
    //Viewcontroller method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.howManyTapsTxt.delegate = self;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //Actions
    
    @IBAction func onTapBtnPressed(sender: UIButton!) {
        currentTaps++
        updateTapsLbl()
        
        if isGameOver() {
            restartGame()
        }
    }
    
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
       
        
        if howManyTapsTxt.text != nil && howManyTapsTxt != "" {
            
            logoImg.hidden = true
            howManyTapsTxt.hidden = true
            playBtn.hidden = true
            
            tapBtn.hidden = false
            tapLbl.hidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            updateTapsLbl()
        }
    }
    
    func updateTapsLbl() {
        tapLbl.text = "\(currentTaps) Taps"
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    func restartGame()  {
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        logoImg.hidden = false
        howManyTapsTxt.hidden = false
        playBtn.hidden = false
        
        tapBtn.hidden = true
        tapLbl.hidden = true
    }
    

}

