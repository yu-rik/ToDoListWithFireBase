//
//  ViewController.swift
//  ToDoListWithFireBase
//
//  Created by yurik on 8/3/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var warnLabel: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailTF.text = ""
        passwordTF.text = ""
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        warnLabel.alpha = 0
//        NotificationCenter.default.addObserver(self, selector: #selector(kbDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(kbDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
//    @objc func kbDidShow(notification: Notification) {
//        guard let userInfo = notification.userInfo else { return }
//        let kbFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//
//        (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height + kbFrameSize.height)
//       (self.view as! UIScrollView).scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbFrameSize.height, right: 0)
//
//    }
//
//    @objc func kbDidHide() {
//        (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height)
//    }
    
    func displayWarningLabel(withText text: String) {
        warnLabel.text = text
        
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { [weak self] in
            self?.warnLabel.alpha = 1
        }) { [weak self] complete in
            self?.warnLabel.alpha = 0
        }
    }
   
    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emailTF.text, let pass = passwordTF.text, email != "", pass != "" else {
            displayWarningLabel(withText: "Info isn't correct")
            return }
        
        Auth.auth().signIn(withEmail: email, password: pass) { [weak self] (user, error) in
            if error != nil {
                self?.displayWarningLabel(withText: "Error!!!!")
                return
            }
            if user != nil {
                self?.performSegue(withIdentifier: "TasksSegue", sender: nil)
                return
            }
            self?.displayWarningLabel(withText: "No such user")
        }
    }
        
    @IBAction func registerTapped(_ sender: UIButton) {
        guard let email = emailTF.text, let pass = passwordTF.text, email != "", pass != "" else {
            displayWarningLabel(withText: "Info isn't correct")
            return }
        
        Auth.auth().createUser(withEmail: email, password: pass, completion:  { [weak self] (user, error) in
            if error != nil {
                if user != nil{
                    self?.performSegue(withIdentifier: "TasksSegue", sender: nil)
                    //self?.performSegue(withIdentifier: "frt", sender: nil)
                }
            }
        })
    }
}

