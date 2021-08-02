//
//  ViewController.swift
//  TempConverter
//
//  Created by linda.zande on 30/07/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var celsiusLabel: UILabel!
    
    @IBOutlet weak var convertedTempLabel: UILabel!
    
    @IBOutlet weak var tempSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var tempSlider: UISlider!
    {
        didSet{
            tempSlider.maximumValue = 100
            tempSlider.minimumValue = 0
            tempSlider.value = 0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        convertedTempLabel.text = "32 ºF"
    }

        

    @IBAction func sliderValueChanged(_ sender: Any) {
        print("tempSlider" , tempSlider.value)
        updateTempLabelForSlider(value: tempSlider.value)
    }
    
    @IBAction func segmentValueCahnged(_ sender: UISegmentedControl) {
        updateTempLabelForSlider(value: tempSlider.value)
    }
    func updateTempLabelForSlider(value: Float){
        let celsiusTemp = Int(value)
        celsiusLabel.text = "\(celsiusTemp) ºC"
        
        var convertedTempString = ""
        switch tempSegmentControl.selectedSegmentIndex {
        case 0:
            let fahrenheitTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).fahrenheit)
            convertedTempString = fahrenheitTempString + " ºF"
        default:
            let kelvinTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).kelvin)
            convertedTempString = kelvinTempString + " ºK"
           
        }
        convertedTempLabel.text = convertedTempString
    }
    func convertTempFrom(celsius: Int) -> (fahrenheit: Double, kelvin: Double){
        let  fahrenheit = (Double(celsius) * 9 / 5) + 32
        let kelvin = Double(celsius) + 273.15
        return (fahrenheit, kelvin)
    }

// MARK: - Navigation

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "tempConverter"{
        let vc = segue.destination as! infoViewController
        vc.infoText = "My home task was to create\na temperature converter and\nthe result is:"
        vc.appDescText = "\(celsiusLabel.text!) = \(String(describing: convertedTempLabel.text!))"
    }
    }

}
