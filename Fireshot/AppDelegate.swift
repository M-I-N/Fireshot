//
//  AppDelegate.swift
//  Fireshot
//
//  Created by Nayem BJIT on 6/14/18.
//  Copyright © 2018 BJIT Ltd. All rights reserved.
//

import Cocoa
import FirebaseCore

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var statusBar = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    var button: NSButton!
    var fs: Fireshot!

    let popover: NSPopover = NSPopover()


    func applicationDidFinishLaunching(_ aNotification: Notification) {

        // Setup Firebase

        popover.behavior = .transient
        FirebaseApp.configure()
        fs = Fireshot()

        button = statusBar.button
        let cloudImage = NSImage(named: NSImage.Name("cloud"))
        button.image = cloudImage
        button.action = #selector(self.toogleViewController)

        fs.setPopover(popover: popover)
        fs.setMenuButton(button: button)


    }

    @objc func toogleViewController(){


        fs.tooglePopover()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

