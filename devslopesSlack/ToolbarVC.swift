//
//  ToolbarVC.swift
//  devslopesSlack
//
//  Created by Beau Galbraith on 6/27/17.
//  Copyright © 2017 Beau Galbraith. All rights reserved.
//

import Cocoa
import CoreFoundation
enum ModalType {
    case login
    case createAccount
}
class ToolbarVC: NSViewController {
    //MARK: Outlets
    
    @IBOutlet weak var loginStackView: NSStackView!
    @IBOutlet weak var loginLabel: NSTextField!
    @IBOutlet weak var loginImage: NSImageView!
    
    var modalBackground: FocusView!
    var modalView: NSView!
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear() {
        setupView()
    }
    
    //MARK: Helper Functions
    func setupView() {
        NotificationCenter.default.addObserver(self, selector: #selector(presentModal(_:)), name: NOTIF_PRESENT_MODAL, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(closeModalNotif(_:)), name: NOTIF_CLOSE_MODAL, object: nil)
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
    
    // MARK: Login Modal Functions
    func presentModal(_ notif: Notification) {
        var modalWidth = CGFloat(0.0)
        var modalHeight = CGFloat(0.0)
        
        if modalBackground == nil {
            modalBackground = FocusView()
            modalBackground.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(modalBackground, positioned: .above, relativeTo: loginStackView)
            let topConstraint = NSLayoutConstraint(item: modalBackground, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 50)
            let trailConstraint = NSLayoutConstraint(item: modalBackground, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
            let leadConstraint = NSLayoutConstraint(item: modalBackground, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: modalBackground, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
            view.addConstraints([topConstraint, bottomConstraint, leadConstraint, trailConstraint])
            modalBackground.layer?.backgroundColor = CGColor.black
            modalBackground.alphaValue = 0.0
            
            let closeBackgroundClick = NSClickGestureRecognizer(target: self, action: #selector(ToolbarVC.closeModalClick(_:)))
            modalBackground.addGestureRecognizer(closeBackgroundClick)
        }
        //MARK: Instantiate Xib
        guard let modalType = notif.userInfo?[USER_INFO_MODAL] as? ModalType else { return }
        switch modalType {
        case ModalType.login:
            modalView = ModalLogin()
            modalWidth = 475
            modalHeight = 300
        case ModalType.createAccount:
            modalView = ModalCreateAccount()
            modalWidth = 475
            modalHeight = 300
        }
        modalView.wantsLayer = true
        modalView.translatesAutoresizingMaskIntoConstraints = false
        modalView.alphaValue = 0
        view.addSubview(modalView, positioned: .above, relativeTo: modalBackground)
        
        let horizontalConstraint = modalView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = modalView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let widthConstraint = modalView.widthAnchor.constraint(equalToConstant: modalWidth)
        let heightConstraint = modalView.heightAnchor.constraint(equalToConstant: modalHeight)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        
        NSAnimationContext.runAnimationGroup({ (context) in
            context.duration = 0.5
            modalBackground.animator().alphaValue = 0.6
            modalView.animator().alphaValue = 1.0
            self.view.layoutSubtreeIfNeeded()
        }, completionHandler: nil)

        

    }
    
    //MARK: Modal Functions
    
    func closeModalNotif(_ notif: Notification) {
        if let removeImmediately = notif.userInfo?[USER_INFO_IMMEDIATELY_REMOVE] as? Bool {
            closeModal(removeImmediately)
        } else {
            closeModal()
        }
    }
    func closeModalClick(_ recognizer: NSClickGestureRecognizer) {
        closeModal()
    }
    func closeModal(_ removeImmediately: Bool = false) {
        if removeImmediately {
            self.modalView.removeFromSuperview()
        } else {
            NSAnimationContext.runAnimationGroup({ (context) in
                context.duration = 0.5
                modalBackground.animator().alphaValue = 0.0
                modalView.animator().alphaValue = 0.0
                self.view.layoutSubtreeIfNeeded()
            }) {
                if self.modalBackground != nil {
                    self.modalBackground.removeFromSuperview()
                    self.modalBackground = nil
                }
                self.modalView.removeFromSuperview()
            }
        }
    }
    

}
