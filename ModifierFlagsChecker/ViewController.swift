//
//  ViewController.swift
//  ModifierFlagsChecker
//
//  Created by Cesare Forelli on 27/10/22.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var textView: NSTextView!
    
    var trackingArea : NSTrackingArea?
    
    
    func createTrackingArea() {
        
        if trackingArea != nil {
            
            self.view.removeTrackingArea(trackingArea!)
        }
        
        trackingArea = NSTrackingArea(rect: self.view.bounds, options: [.mouseEnteredAndExited, .activeAlways], owner: self, userInfo: nil)
        
        self.view.addTrackingArea(trackingArea!)
    }

    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        createTrackingArea()
        
        textView.isEditable = false
    }

    
    override func mouseEntered(with event: NSEvent) {

        if let flags = NSApp.currentEvent?.modifierFlags {
            
            var logMessage : String
            
            if flags.contains([.shift]) {
                
                logMessage = "✅ \(Date()) - Shift key detected. NSApp.currentEvent?.modifierFlags: \(String(describing: NSApp.currentEvent?.modifierFlags))"
                
            } else {
                
                logMessage = "❌ \(Date()) - Shift key not detected. NSApp.currentEvent?.modifierFlags: \(String(describing: NSApp.currentEvent?.modifierFlags))"
            }
            
            print(logMessage)
            
            textView.string = "\(logMessage)\n\(textView.string)"
        }
    }
}

