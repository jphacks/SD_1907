//
//  CancelledTicketInfoInputViewController.swift
//  jphacks
//
//  Created by 山下陽央 on 2019/10/25.
//  Copyright © 2019 山下陽央. All rights reserved.
//

import UIKit

class CancelledTicketInfoInputViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureObserver()
    }
    
    @IBOutlet weak var departureTextField: UITextField! {
        didSet {
            departureTextField.delegate = self
        }
    }
    @IBOutlet weak var budgetTextField: UITextField! {
        didSet {
            budgetTextField.delegate = self
        }
    }
    @IBOutlet weak var returnTextField: UITextField! {
        didSet {
            returnTextField.delegate = self
        }
    }
    @IBOutlet weak var numberOfPplTextField: UITextField! {
        didSet {
            numberOfPplTextField.delegate = self
        }
    }

    @IBOutlet weak var VFView: UIVisualEffectView! {
        didSet {
            VFView.layer.cornerRadius = 8
            VFView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var confirmButton: UIButton! {
        didSet {
            confirmButton.layer.cornerRadius = 8
        }
    }
    
    func configureObserver() {
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(keyboardWillShow(_:)),
                                 name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide(_:)),
                                 name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification?) {
        guard let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue,
            let duration = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
        UIView.animate(withDuration: duration) {
            let transform = CGAffineTransform(translationX: 0, y: -(rect.size.height - 150))
            self.view.transform = transform
        }
    }

    @objc func keyboardWillHide(_ notification: Notification?) {
        guard let duration = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? TimeInterval else { return }
        UIView.animate(withDuration: duration) {
            self.view.transform = CGAffineTransform.identity
        }
    }
    
    
    
//    https://tech-blog.sgr-ksmt.org/2016/02/20/form_changeable/
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField != numberOfPplTextField {
            textField.resignFirstResponder()
        }

        return true
    }
    
}

