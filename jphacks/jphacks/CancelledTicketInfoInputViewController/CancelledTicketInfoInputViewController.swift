//
//  CancelledTicketInfoInputViewController.swift
//  jphacks
//
//  Created by 山下陽央 on 2019/10/25.
//  Copyright © 2019 山下陽央. All rights reserved.
//

import UIKit

class CancelledTicketInfoInputViewController: UIViewController, UITextFieldDelegate {
    private var textfields = [UITextField]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        textfields += [departureTextField, budgetTextField, returnTextField, numberOfPplTextField]
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
        guard let rect = (notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
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
    
    @IBAction func didTapSearchButton(_ sender: Any) {
        search()
    }
    
    private func search() {
        for textField in textfields {
            textField.resignFirstResponder()
        }
        let vc = PlanCandidatesTableViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    https://tech-blog.sgr-ksmt.org/2016/02/20/form_changeable/
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField != numberOfPplTextField {
            let nextTag = textField.tag + 1
            if let nextTextField = view.viewWithTag(nextTag) {
                nextTextField.becomeFirstResponder()
            }
        } else {
            search()
        }

        return true
    }
    
    
}

