//
//  infoViewController.swift
//  TempConverter
//
//  Created by linda.zande on 31/07/2021.
//

import UIKit

class infoViewController: UIViewController {

    @IBOutlet weak var appInfoLabel: UILabel!
    @IBOutlet weak var appDescLabel: UILabel!
    
    var infoText = ""
    var appDescText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if !infoText.isEmpty && !appDescText.isEmpty{
            appInfoLabel.text = infoText
            appDescLabel.text = appDescText
        // Do any additional setup after loading the view.
    }
    }

 

}
