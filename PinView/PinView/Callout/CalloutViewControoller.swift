//
//  CalloutViewControoller.swift
//  PinView
//
//  Created by Andreas Vasileiou on 30/07/2020.
//  Copyright © 2020 Andreas Vasileiou. All rights reserved.
//

import UIKit

class CalloutViewController: UIView{

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var subtitle: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var type: UILabel!
    
    
    @IBAction func direction(_ sender: Any) {
        print("got press")
    }
    
    
}
