//
//  Constants.swift
//  devslopesSlack
//
//  Created by Beau Galbraith on 6/27/17.
//  Copyright © 2017 Beau Galbraith. All rights reserved.
//

import Foundation
import Cocoa
//Colors

let chatPurlple = NSColor(calibratedRed: 0.30, green: 0.22, blue: 0.29, alpha: 1.00)
let chatGreen = NSColor(calibratedRed: 0.22, green: 0.66, blue: 0.68, alpha: 1.00)
let AVENIR = "AvenirNext-Regular"
let AVENIR_BOLD = "AvenirNext-Bold"

// Notification Constants

let USER_INFO_MODAL = "modalUserInfo"
let NOTIF_PRESENT_MODAL = Notification.Name("presentModal")
let NOTIF_CLOSE_MODAL = Notification.Name("closeModal")
let USER_INFO_IMMEDIATELY_REMOVE = "modalRemoveImmediately"
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// URL Constants
let BASE_URL = "http://localhost:3005/v1"
let URL_REGISTER = "\(BASE_URL)/account/register"
let URL_LOGIN = "\(BASE_URL)/account/login"
typealias CompletionHandler = (_ Success: Bool) -> ()

