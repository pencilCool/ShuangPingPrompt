//
//  ViewController.swift
//  ShuangPingPrompt
//
//  Created by yuhua Tang on 2024/3/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

        // Add an observer to know when app comes to foreground to update UI
        NotificationCenter.default.addObserver(self, selector: #selector(reloadViews), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        
        let nib = UINib(nibName: "XiaoHeView", bundle: nil)
        let xiaoHeView = nib.instantiate(withOwner: nil, options: nil).first as! XiaoHeView
        
        let keyboardContainerView = UIView(frame: xiaoHeView.frame)
        keyboardContainerView.addSubview(xiaoHeView)
        textField.inputView = keyboardContainerView
       
        
        textField.addObserver(self, forKeyPath: "selectedTextRange", options: .new, context: nil)

//        xiaoHeView.setNextKeyboardVisible(false)
        
    }

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      reloadViews()
    }
    
    deinit {
      NotificationCenter.default.removeObserver(self)
      textField.removeObserver(self, forKeyPath: "selectedTextRange")
    }
    
    @objc func reloadViews() {
      // Start the app with the keyboard showing
      textField.becomeFirstResponder()
    }
    
    
    @objc func keyboardWillShow(_ notification: Notification) {
  
    }

  
}

