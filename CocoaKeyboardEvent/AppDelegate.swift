//
//  AppDelegate.swift
//  CocoaKeyboardEvent
//
//  Created by Tong Zhang on 10/7/15.
//  Copyright © 2015 Tong Zhang. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    @IBAction func biggerFont(sender: NSMenuItem) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "FontSize"), object: "bigger")
    }
    
    @IBAction func smallerFont(sender: NSMenuItem) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "FontSize"), object: "smaller")
    }

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

