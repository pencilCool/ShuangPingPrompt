//
//  KeyboardViewController.swift
//  XiaoHe
//
//  Created by yuhua Tang on 2024/3/14.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
   
    var xiaoHeView: UIImageView!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        xiaoHeView =  UIImageView()
        xiaoHeView.image =  UIImage(named: "xiaohe")
        guard let inputView = inputView else { return }
        inputView.addSubview(xiaoHeView)
        xiaoHeView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            xiaoHeView.leftAnchor.constraint(equalTo: inputView.leftAnchor),
            xiaoHeView.topAnchor.constraint(equalTo: inputView.topAnchor),
            xiaoHeView.rightAnchor.constraint(equalTo: inputView.rightAnchor),
            xiaoHeView.bottomAnchor.constraint(equalTo: inputView.bottomAnchor),
            
            xiaoHeView.heightAnchor.constraint(equalToConstant: 200)
          ])

        
        self.nextKeyboardButton = UIButton(type: .system)
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}
