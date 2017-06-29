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
        
    }
    
    
}
