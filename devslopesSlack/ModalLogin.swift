//
//  ModalLogin.swift
//  devslopesSlack
//
//  Created by gem on 6/27/17.
//  Copyright © 2017 Beau Galbraith. All rights reserved.
//

import Cocoa

class ModalLogin: NSView {
    // MARK: Outlets
    @IBOutlet weak var view: NSView!
    @IBOutlet weak var emailText: NSTextField!
    @IBOutlet weak var passwordText: NSTextField!
    @IBOutlet weak var createButton: NSButton!
    
    @IBOutlet weak var exitButton: NSButton!
    @IBOutlet weak var loginButton: NSButton!
    @IBAction func loginPushed(_ sender: NSButton) {
    
    }
    @IBAction func createPushed(_ sender: NSButton) {
        let closeImmediateDict:[String: Bool] = [USER_INFO_IMMEDIATELY_REMOVE: true]
        NotificationCenter.default.post(name: NOTIF_CLOSE_MODAL, object: nil, userInfo: closeImmediateDict)
    }
    
    @IBAction func exitButtonPushed(_ sender: NSButton) {
        NotificationCenter.default.post(name: NOTIF_CLOSE_MODAL, object: nil)
    }
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        Bundle.main.loadNibNamed("ModalLogin", owner: self, topLevelObjects: nil)
        self.addSubview(self.view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        setupView()
        // Drawing code here.
    }
    func setupView() {
        self.view.frame = NSRect(x: 0, y: 0, width: 475, height: 300)

        view.layer?.backgroundColor = CGColor.white
        
        view.layer?.cornerRadius = 7
        loginButton.layer?.backgroundColor = chatGreen.cgColor
        loginButton.layer?.cornerRadius = 7
        loginButton.styleButtonText(button: loginButton, buttonName: "Login", fontColor: .white, alignment: .center, font: AVENIR, size: 14.0)
        createButton.styleButtonText(button: createButton, buttonName: "Create", fontColor: chatGreen, alignment: .center, font: AVENIR, size: 12.0)
    }
}
