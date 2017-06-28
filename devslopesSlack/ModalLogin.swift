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
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        Bundle.main.loadNibNamed("ModalLogin", owner: self, topLevelObjects: nil)
        self.view.frame = NSRect(x: 0, y: 0, width: 475, height: 300)
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
        view.layer?.backgroundColor = CGColor.white
        
        view.layer?.cornerRadius = 7
    }
}
