//
//  AppearenceViewController.swift
//  TempConverter
//
//  Created by linda.zande on 31/07/2021.
//

import UIKit

class AppearenceViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func openSettingTapped(_ sender: Any) {
        openSetting()
    }
    func setLabelText(){
        var text = "Unable to specify IU style"
        if self.traitCollection.userInterfaceStyle == .dark{
            text = "Dark Mode is On\nGo to settings if you would like\nto change to Light mode"
        }else{
            text = "Light Mode is On\nGo to settings if you would like\nto change to Dark mode"
        }
        textLabel.text = text
        
    }
    func openSetting(){
        guard let settingURL = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingURL){
            UIApplication.shared.open(settingURL, options: [:]) {
                success in
                print("success: ", success)
            }
        }
    }

}
extension AppearenceViewController{
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}
