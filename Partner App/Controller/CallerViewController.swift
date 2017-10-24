//
//  CallerViewController.swift
//  Partner App
//
//  Created by Gustavo Serra on 20/10/2017.
//  Copyright © 2017 iHealthLabs. All rights reserved.
//

import UIKit

class CallerViewController: UIViewController {

    @IBOutlet weak var callApplicationButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    private func setupView() {
        
        self.callApplicationButton.setTitle("callApplicationButton".localized, for: .normal)
        self.callApplicationButton.backgroundColor = Colors.secondaryColor.color
        self.callApplicationButton.setTitleColor(Colors.textWithBackgroudColor.color, for: .normal)
        
        self.logoutButton.setTitle("logoutTitleButton".localized, for: .normal)
        self.logoutButton.backgroundColor = Colors.backgroundColor.color
        self.logoutButton.setTitleColor(Colors.dangerColor.color, for: .normal)
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

    @IBAction func callApplicationButtonClicked(_ sender: Any) {
        
        self.openAppURL("ihealth-suivi://") { (result) in
            print("Open: \(result)")
        }
    }
    
    @IBAction func logoutButtonClicked(_ sender: Any) {
        
        UserDefaults.standard.set(false, forKey: "session")
        UserDefaults.standard.synchronize()
        
        let signinViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "SignInViewController")
        UIApplication.shared.keyWindow?.replaceRootViewControllerWith(signinViewController, animated: true, completion: nil)
    }
}
