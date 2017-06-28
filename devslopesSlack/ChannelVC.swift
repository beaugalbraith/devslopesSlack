//
//  ChannelVC.swift
//  devslopesSlack
//
//  Created by Beau Galbraith on 6/27/17.
//  Copyright © 2017 Beau Galbraith. All rights reserved.
//

import Cocoa

class ChannelVC: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var userLabel: NSTextField!
    @IBOutlet weak var channelLabel: NSTextField!
    @IBOutlet weak var addChannelButton: NSButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }
    func setupView() {
        view.wantsLayer = true
        view.layer?.backgroundColor = chatPurlple.cgColor
        
        addChannelButton.styleButtonText(button: addChannelButton, buttonName: "Add +", fontColor: .controlColor, alignment: .center, font: AVENIR, size: 13.0)
    }
}
