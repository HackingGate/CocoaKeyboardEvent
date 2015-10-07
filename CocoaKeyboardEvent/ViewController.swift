//
//  ViewController.swift
//  CocoaKeyboardEvent
//
//  Created by Tong Zhang on 10/7/15.
//  Copyright © 2015 Tong Zhang. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var outputView: NSTextView!
    
    override func loadView() {
        super.loadView()
        NotificationCenter.default.addObserver(self, selector: #selector(methodOfReceivedNotification(notification:)), name:NSNotification.Name(rawValue: "FontSize"), object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func methodOfReceivedNotification(notification: NSNotification){
        if notification.object != nil {            
            switch notification.description {
                case "bigger":
                    outputView.font = NSFont.userFont(ofSize: outputView.font!.pointSize+1)
                    break
                
                case "smaller":
                    outputView.font = NSFont.userFont(ofSize: outputView.font!.pointSize-1)
                    break
                
                default:
                    break
            }
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

