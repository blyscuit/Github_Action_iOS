//
//  ViewController.swift
//  DeeMoney
//
//  Created by Bliss on 1/10/20.
//

import UIKit
import Keys

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let authKey = DeeMoneyKeys().transloaditAuthKey
        print(authKey)
    }

}
