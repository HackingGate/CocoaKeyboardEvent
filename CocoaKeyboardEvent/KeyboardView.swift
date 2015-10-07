//
//  KeyboardView.swift
//  CocoaKeyboardEvent
//
//  Created by Tong Zhang on 10/7/15.
//  Copyright © 2015 Tong Zhang. All rights reserved.
//

import Cocoa

class KeyboardView: NSView {
    
    let redColor = NSColor.red.cgColor
    let clearColor = NSColor.clear.cgColor
    
    override var acceptsFirstResponder: Bool { return true }

    @IBOutlet var outputView: NSTextView!
    @IBOutlet weak var shiftLabel: NSTextField!
    @IBOutlet weak var controlLabel: NSTextField!
    @IBOutlet weak var optionLabel: NSTextField!
    @IBOutlet weak var commandLabel: NSTextField!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.        
        self.wantsLayer = true
        self.layer?.borderWidth = 2
        self.layer?.borderColor = clearColor
        shiftLabel.layer?.borderWidth = 2
        shiftLabel.layer?.borderColor = clearColor
        controlLabel.layer?.borderWidth = 2
        controlLabel.layer?.borderColor = clearColor
        optionLabel.layer?.borderWidth = 2
        optionLabel.layer?.borderColor = clearColor
        commandLabel.layer?.borderWidth = 2
        commandLabel.layer?.borderColor = clearColor
    }
    
    override func keyDown(with theEvent: NSEvent) {
        self.layer?.borderColor = redColor
        if (outputView.string.isEmpty) {
            outputView.string.append(theEvent.keyCode.description)
        }else {
            outputView.string.append(" " + theEvent.keyCode.description)
        }
        outputView.scrollToEndOfDocument(nil)
    }
    
    override func flagsChanged(with theEvent: NSEvent) {
        shiftLabel.layer?.borderColor = theEvent.modifierFlags.contains(.shift) ? redColor : clearColor
        controlLabel.layer?.borderColor = theEvent.modifierFlags.contains(.control) ? redColor : clearColor
        optionLabel.layer?.borderColor = theEvent.modifierFlags.contains(.option) ? redColor : clearColor
        commandLabel.layer?.borderColor = theEvent.modifierFlags.contains(.command) ? redColor : clearColor
    }
    
    override func keyUp(with theEvent: NSEvent) {
        self.layer?.borderColor = clearColor
    }
    
    @IBAction func cleanTextView(sender: AnyObject) {
        outputView.string = ""
    }
    
}
