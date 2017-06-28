//
//  ChatVC.swift
//  devslopesSlack
//
//  Created by Beau Galbraith on 6/27/17.
//  Copyright © 2017 Beau Galbraith. All rights reserved.
//

import Cocoa

class ChatVC: NSViewController {
    @IBOutlet weak var channelTitle: NSTextField!
    @IBOutlet weak var channelDescription: NSTextField!
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var isTypingLabel: NSTextField!
    @IBOutlet weak var messageOutlineView: NSView!
    @IBOutlet weak var messageText: NSTextField!
    @IBOutlet weak var sendButton: NSButton!
    @IBAction func sendAction(_ sender: NSButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView() {
        view.wantsLayer = true
        view.layer?.backgroundColor = CGColor.white
        
        messageOutlineView.wantsLayer = true
        messageOutlineView.layer?.backgroundColor = CGColor.white
        messageOutlineView.layer?.borderColor = NSColor.controlHighlightColor.cgColor
        messageOutlineView.layer?.borderWidth = 2
        messageOutlineView.layer?.cornerRadius = 5
        sendButton.styleButtonText(button: sendButton, buttonName: "Send", fontColor: NSColor.darkGray, alignment: .center, font: AVENIR, size: 13.0)

    }
}
