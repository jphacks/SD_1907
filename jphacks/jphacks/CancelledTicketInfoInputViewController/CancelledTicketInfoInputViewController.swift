//
//  CancelledTicketInfoInputViewController.swift
//  jphacks
//
//  Created by 山下陽央 on 2019/10/25.
//  Copyright © 2019 山下陽央. All rights reserved.
//

import UIKit
import SVProgressHUD

class CancelledTicketInfoInputViewController: UIViewController, UITextFieldDelegate {
    private var textfields = [UITextField]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureObserver()
        var buggetDataList: [String] = []

        for i in stride(from: 1000, to: 501000, by: 1000) {
            buggetDataList += [String(i)]
        }
        budgetPicker.setup(dataList: buggetDataList)
        
        var pplDataList: [String] = []
        
        for k in 0..<21 {
            pplDataList += [String(k)]
        }
        
        numOfPplPicker.setup(dataList: pplDataList)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        textfields += [departureTextField, budgetPicker, returnDatePicker, numOfPplPicker]
    }
    
    @IBOutlet weak var departureTextField: UITextField! {
        didSet {
            departureTextField.delegate = self
        }
    }
    @IBOutlet weak var budgetPicker: PickerTextField!
    @IBOutlet weak var returnDatePicker: DatePickerKeyboard!
    @IBOutlet weak var numOfPplPicker: PickerTextField!
    
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
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        if let nextTextField = view.viewWithTag(nextTag) {
            nextTextField.becomeFirstResponder()
        }
        return true
    }
    
    private func showProgress() {
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.show()
    }
    
    private func dismissProgress() {
        SVProgressHUD.setDefaultMaskType(.none)
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}
