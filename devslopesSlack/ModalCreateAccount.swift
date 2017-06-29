//
//  ModalCreateAccount.swift
//  devslopesSlack
//
//  Created by gem on 6/28/17.
//  Copyright © 2017 Beau Galbraith. All rights reserved.
//

import Cocoa

class ModalCreateAccount: NSView {
    
    // MARK: Outlets
    @IBOutlet weak var view: NSView!
    @IBOutlet weak var nameField: NSTextField!
    @IBOutlet weak var emailField: NSTextField!
    @IBOutlet weak var passwordField: NSTextField!
    @IBOutlet weak var createAccountButton: NSButton!
    @IBOutlet weak var gravatarImage: NSImageView!
    @IBOutlet weak var chooseImageButton: NSButton!
    @IBOutlet weak var exitButton: NSButton!
    
    
    @IBAction func createAccountPushed(_ sender: NSButton) {
    }
    @IBAction func chooseImagePressed(_ sender: NSButton) {
    }
    @IBAction func exitButtonPressed(_ sender: NSButton) {
        NotificationCenter.default.post(name: NOTIF_CLOSE_MODAL, object: nil)

    }
    
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        Bundle.main.loadNibNamed("ModalCreateAccount", owner: self, topLevelObjects: nil)
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
        gravatarImage.layer?.cornerRadius = 10
        gravatarImage.layer?.borderColor = NSColor.gray.cgColor
        
        createAccountButton.layer?.backgroundColor = chatGreen.cgColor
        createAccountButton.layer?.cornerRadius = 7
        createAccountButton.styleButtonText(button: createAccountButton, buttonName: "Create Account", fontColor: .white, alignment: .center, font: AVENIR, size: 13.0)
        chooseImageButton.layer?.cornerRadius = 7
        chooseImageButton.layer?.backgroundColor = chatGreen.cgColor
        chooseImageButton.styleButtonText(button: chooseImageButton, buttonName: "Choose Avatar", fontColor: .white, alignment: .center, font: AVENIR, size: 13.0)
        
        nameField.focusRingType = .none
        
    }
    
    
}
