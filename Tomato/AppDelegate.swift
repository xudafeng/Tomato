//
//  AppDelegate.swift
//  Tomato
//
//  Created by xdf on 7/21/14.
//  Copyright (c) 2014 xdf. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet var window: NSWindow
    var label = NSText();
    var backgroundImage = NSImageView()
    var timeLabel = NSText();
    var run = false;
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        
        NSLog ("\nApp Start Launching ...");
        var title: NSString;
        title = "Pay more attention to do more.";
        window.styleMask = 5;
        window.alphaValue = 0.95;
        window.hasShadow = true;
        window.setTitleWithRepresentedFilename(title);
        window.center();
        window.setFrame(NSRect(x: 0, y: 0, width: 300, height: 200), display: true);
        label.alignment = .CenterTextAlignment;
        label.frame = NSRect(x: 10, y: 10, width: 100, height: 20);
        label.string = "test label";
        window.contentView.addSubview(label);
        backgroundImage.frame = window.contentView.frame;
        backgroundImage.image = NSImage(named: "tomato");
        window.contentView.addSubview(backgroundImage);
        timeLabel.string = "60"
        timeLabel.frame = NSRect(x: 0, y: 0, width: 100, height: 40);
        timeLabel.textColor = NSColor.redColor();
        window.contentView.addSubview(timeLabel);
        
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "countDown", userInfo: nil, repeats: true);

        
    }
    
    func countDown () {
        if(!run) {
            return;
        }
        self.window.orderOut(nil);
        if (timeLabel.string.toInt() == 50 ) {
            timeLabel.string = "60";
            self.window.orderFront(nil)
        }
        else {
            let temp = timeLabel.string.toInt()! - 1;
            timeLabel.string = String(temp);
        }
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        label.textColor = NSColor.redColor();
        run = true;
    }
    
}


