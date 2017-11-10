//
//  CallerViewController.swift
//  Partner App
//
//  Created by Gustavo Serra on 20/10/2017.
//  Copyright © 2017 iHealthLabs. All rights reserved.
//

import UIKit

class CallerViewController: UIViewController {

    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var callApplicationButton: UIButton!
    
    private func setupView() {
        
        self.profileButton.setTitle("profileButton".localized, for: .normal)
        self.profileButton.backgroundColor = Colors.secondaryColor.color
        self.profileButton.setTitleColor(Colors.textWithBackgroudColor.color, for: .normal)
        
        self.callApplicationButton.setTitle("callApplicationButton".localized, for: .normal)
        self.callApplicationButton.backgroundColor = Colors.secondaryColor.color
        self.callApplicationButton.setTitleColor(Colors.textWithBackgroudColor.color, for: .normal)
    }
    
    private func openAppURL(_ scheme: String, completionHandler: @escaping (_ success: Bool) -> ()) {
        
        guard let layeredAppURL = URL(string: scheme)
            else {
                print("BAD Scheme")
                return
        }
        
        if #available(iOS 10, *) {
            UIApplication.shared.open(layeredAppURL, options: [:],
                                      completionHandler: {
                                        (success) in
                                        
                                        completionHandler(success)
            })
        } else {
            
            let success = UIApplication.shared.openURL(layeredAppURL)
            
            completionHandler(success)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
    }
    
    @IBAction func profileButtonClicked(_ sender: Any) {
    }
    
    @IBAction func callApplicationButtonClicked(_ sender: Any) {
        
        if let userStored = DataManager.sharedInstnce.loadData(forKey: "user") as? User {
            
            let encodedName = String(describing: userStored.name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            let encodedPhoto = String(describing: userStored.photo.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            
            self.openAppURL("ihealth-suivi://?name=\(encodedName)&height=\(userStored.height)&photo=\(encodedPhoto)") { (result) in
                print("Open: \(result)")
            }
        } else {
            
            self.openAppURL("ihealth-suivi://") { (result) in
                print("Open: \(result)")
            }
        }
    }
}
