//
//  ViewController.swift
//  2_auto_layout
//
//  Created by David Granado Jordan on 5/31/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bottomConstratint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector( keyboardWillShow(_:)  ), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector( keyboardWillHide(_:)  ), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard) )
        self.view.addGestureRecognizer(tap)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillShowNotification)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
         
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillShowNotification)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    
    @objc func keyboardWillShow(_ notification: Notification ) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
        else { return }
              
        bottomConstratint.constant = keyboardFrame.size.height
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc func keyboardWillHide(_ notification: Notification ) {
        guard let userInfo = notification.userInfo,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
        else { return }
              
        bottomConstratint.constant = 35
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
        
    }

}

