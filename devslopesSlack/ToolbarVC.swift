//
//  ToolbarVC.swift
//  devslopesSlack
//
//  Created by Beau Galbraith on 6/27/17.
//  Copyright © 2017 Beau Galbraith. All rights reserved.
//

import Cocoa
enum ModalType {
    case login
}
class ToolbarVC: NSViewController {
    //Outlets
    
    @IBOutlet weak var loginStackView: NSStackView!
    @IBOutlet weak var loginLabel: NSTextField!
    @IBOutlet weak var loginImage: NSImageView!
    
    var modalBackground: FocusView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear() {
        setupView()
    }
    func setupView() {
        NotificationCenter.default.addObserver(self, selector: #selector(presentModal(_:)), name: NOTIF_PRESENT_MODAL, object: nil)
        view.wantsLayer = true
        view.layer?.backgroundColor = chatGreen.cgColor
        
        loginStackView.gestureRecognizers.removeAll()
        let profilePageClick = NSClickGestureRecognizer(target: self, action: #selector(ToolbarVC.openProfilePage(_:)))
        loginStackView.addGestureRecognizer(profilePageClick)
    }
    
    func openProfilePage(_ recognizer: NSClickGestureRecognizer) {
        print("open profile page")
        
        let loginDict: [String: ModalType] = [USER_INFO_MODAL: ModalType.login]
        NotificationCenter.default.post(name: NOTIF_PRESENT_MODAL, object: nil, userInfo: loginDict)
    }
    
    func presentModal(_ notif: Notification) {
        print("present login modal")
        modalBackground = FocusView()
        modalBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(modalBackground, positioned: .above, relativeTo: loginStackView)
        let topConstraint = NSLayoutConstraint(item: modalBackground, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 50)
//        let bottomConstraint
//        let leadConstraint
//        let trailConstraint
    }
}
