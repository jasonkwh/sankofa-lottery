//
//  FirstViewController.swift
//  sankofa-lottery
//
//  Created by Jason Wong on 29/11/16.
//  Copyright © 2016 Jason Wong. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var prevLabel: UILabel!
    @IBOutlet weak var inputfield: UITextField!

    @IBAction func deletePrev(_ sender: Any) {
        if(globalVal.arrayOfNames.count > 0) {
            globalVal.arrayOfNames.removeLast()
            if(globalVal.arrayOfNames.count >= 1) {
                prevLabel.text = globalVal.arrayOfNames[globalVal.arrayOfNames.count-1]
            } else {
                prevLabel.text = ""
            }
            print(globalVal.arrayOfNames)
        } else {
            let alertController = UIAlertController(title: "Error", message: "Array cannot be null", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func submitAction(_ sender: Any) {
        if(inputfield.text != "") {
            globalVal.arrayOfNames.append(inputfield.text!)
            prevLabel.text = inputfield.text
            inputfield.text = ""
        }
        print(globalVal.arrayOfNames)
    }
    
    @IBAction func clearAction(_ sender: Any) {
        inputfield.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        prevLabel.text = ""
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

