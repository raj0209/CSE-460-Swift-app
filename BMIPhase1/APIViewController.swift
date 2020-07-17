//
//  APIViewController.swift
//  BMIPhase1
//
//  Created by Apple on 25/06/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class APIViewController: UIViewController {

    @IBOutlet weak var hField: UITextField!
    
    @IBOutlet weak var wField: UITextField!
    
    @IBOutlet weak var outField: UITextField!
    @IBOutlet weak var msgField: UITextField!
    
    struct bmiResults : Decodable{
        let bmi: Double
        let more: [String]
        let risk: String
    }
    
    var bmi: Double = 0
    var links: [String] = []
    var msg: String = ""
    
    
    @IBAction func callBMIAPI(_ sender: Any) {
        let heightInt: Int? = Int(hField.text!)
        let weightInt: Int? = Int(wField.text!)
        
        let urlString: String = "http://webstrar99.fulton.asu.edu/page3/Service1.svc/calculateBMI?height=\(heightInt!)&weight=\(weightInt!)"
                
        let url = URL(string: urlString)!
        let session = URLSession.shared
        let jsonQuery = session.dataTask(with: url, completionHandler: { data, response, error in
            
            let decoder = JSONDecoder()
            let jsonResult = try! decoder.decode(bmiResults.self, from: data!)
            
            self.bmi = jsonResult.bmi
            self.links = jsonResult.more
            self.msg = jsonResult.risk
                    
            DispatchQueue.main.async {
                let bmiVal = String(format:"%.1f",self.bmi)
                    
                self.outField.text = bmiVal
                self.msgField.text = self.msg
                
                if(self.bmi<18){
                    self.msgField.textColor = UIColor.blue
                    self.outField.textColor = UIColor.blue
                }
                else if(self.bmi<25){
                    self.msgField.textColor = UIColor.green
                    self.outField.textColor = UIColor.green
                }
                else if(self.bmi<30){
                    self.msgField.textColor = UIColor.purple
                    self.outField.textColor = UIColor.purple
                }
                else{
                    self.msgField.textColor = UIColor.red
                    self.outField.textColor = UIColor.red
                }
            }
                    
        })
                
        jsonQuery.resume()
    }
    
    @IBAction func provideInfo(_ sender: Any) {
        guard let url = URL(string: self.links[0]) else { return }
        if #available(iOS 10.0, *){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        else{
            UIApplication.shared.openURL(url)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
