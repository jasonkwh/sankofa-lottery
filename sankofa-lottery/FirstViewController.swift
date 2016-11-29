//
//  FirstViewController.swift
//  sankofa-lottery
//
//  Created by Jason Wong on 29/11/16.
//  Copyright © 2016 Jason Wong. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var inputfield: UITextField!

    @IBAction func submitAction(_ sender: Any) {
        if(inputfield.text != "") {
            globalVal.arrayOfNames.append(inputfield.text!)
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

