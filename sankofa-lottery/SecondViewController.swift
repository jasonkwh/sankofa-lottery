//
//  SecondViewController.swift
//  sankofa-lottery
//
//  Created by Jason Wong on 29/11/16.
//  Copyright © 2016 Jason Wong. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var nametag: UILabel!
    var lotteryTimer = Timer()
    var nameTimer = Timer()
    var timeFieldBk: String = ""
    var timeFieldBkOn: Bool = false
    var counter: Int = 0
    var randomName: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nametag.text = ""
        timeField.text = "10"
    }
    
    @IBAction func startLot(_ sender: Any) {
        if(globalVal.arrayOfNames.count == 0) {
            let alertController = UIAlertController(title: "Error", message: "Array cannot be null", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        } else {
            if(timeFieldBkOn == false) {
                timeFieldBk = timeField.text!
                timeFieldBkOn = true
            }
            counter = Int(timeField.text!)!
            lotteryTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SecondViewController.updateTextfield), userInfo: nil, repeats: true)
            nameTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(SecondViewController.updateNametag), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        lotteryTimer.invalidate()
        nameTimer.invalidate()
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        lotteryTimer.invalidate()
        nameTimer.invalidate()
        counter = 0
        randomName = 0
        nametag.text = ""
        if(timeFieldBk != "") {
            timeField.text = timeFieldBk
        }
        timeFieldBkOn = false
    }
    
    func updateNametag() {
        randomName = randRange(lower: 0, upper: globalVal.arrayOfNames.count-1)
        nametag.text = globalVal.arrayOfNames[randomName]
    }
    
    func updateTextfield() {
        if(counter > 0) {
            counter = counter - 1
            timeField.text = String(counter)
        } else if(counter <= 0) {
            lotteryTimer.invalidate()
            nameTimer.invalidate()
            counter = 0
            globalVal.arrayOfNames.remove(at: randomName)
            randomName = 0
            timeField.text = timeFieldBk
            timeFieldBkOn = false
        }
    }
    
    func randRange (lower: Int , upper: Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

