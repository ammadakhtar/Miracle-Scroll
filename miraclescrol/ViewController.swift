//
//  ViewController.swift
//  miraclescrol
//
//  Created by Ammad on 15/01/2017.
//  Copyright © 2017 Ammad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let states = ["Islamabad", "Lahore", "Karachi", "Multan", "Faislabad", "Gujranwala", "Quetta", "Peshawar"]
    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var fullnametext: UITextField!
    @IBOutlet weak var StreetAddress: UILabel!
    @IBOutlet weak var StreetAddresstext: UITextField!
    @IBOutlet weak var City: UILabel!
    @IBOutlet weak var CityText: UITextField!
    @IBOutlet weak var State: UILabel!
    @IBOutlet weak var StateButton: UIButton!
    @IBOutlet weak var Country: UILabel!
    @IBOutlet weak var CountryText: UITextField!
    @IBOutlet weak var ZipCode: UILabel!
    @IBOutlet weak var ZipCodeText: UITextField!
    @IBOutlet weak var BuyNowBtn: UIImageView!
    @IBOutlet weak var StatePicker: UIPickerView!
    @IBOutlet weak var Success: UIImageView!
    
    @IBOutlet weak var BuyBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        StatePicker.delegate = self
        StatePicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func StatePickerBtnPressed(_ sender: Any) {
        StatePicker.isHidden = false
        Country.isHidden = true
        CountryText.isHidden = true
        ZipCode.isHidden = true
        ZipCodeText.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        StateButton.setTitle(states[row], for: UIControlState.normal)
        StatePicker.isHidden = true
        Country.isHidden = false
        CountryText.isHidden = false
        ZipCode.isHidden = false
        ZipCodeText.isHidden = false
    }
    
    
    
    @IBAction func InfoBtnPressed(_ sender: Any) {
        let infoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "info") as! InfoViewController
        self.addChildViewController(infoVC)
        infoVC.view.frame = self.view.frame
        self.view.addSubview(infoVC.view)
        infoVC.didMove(toParentViewController: self)
    }
    

    @IBAction func BuyBtnPressed(_ sender: Any) {
            if checkempty() {
                let successVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "success") as! SuccessViewController
                self.addChildViewController(successVC)
                successVC.view.frame = self.view.frame
                self.view.addSubview(successVC.view)
                successVC.didMove(toParentViewController: self)
                self.view.endEditing(true)
                cleartext()
            } else {
                let errorVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "error") as! ErrorViewController
                self.addChildViewController(errorVC)
                errorVC.view.frame = self.view.frame
                self.view.addSubview(errorVC.view)
                errorVC.didMove(toParentViewController: self)
            }
        
    }
    
    func cleartext()
    {
        fullnametext.text = ""
        StreetAddresstext.text = ""
        CityText.text = ""
        CountryText.text = ""
        ZipCodeText.text = ""
    }
    
    func checkempty() -> Bool
    {
        if fullnametext.text != "" && StreetAddresstext.text != "" && CityText.text != "" && CountryText.text != "" && ZipCodeText.text != ""
        {
       return true
        }
        else
        {
            return false
        }

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func resignFirstResponder() -> Bool {
        self.view.endEditing(true)
        return true
    }

}

