//
//  AppDelegate.swift
//  Tomato
//
//  Created by xdf on 7/21/14.
//  Copyright (c) 2014 xdf. All rights reserved.
//

import Cocoa;

class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet var window: NSWindow
    @IBOutlet var myButton: NSButton
    
    var label = NSText();
    var backgroundImage = NSImageView()
    var timeLabel = NSText();
    var run = false;
    let DEFAULT_TIME = "5";
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        
        NSLog ("\nApp Start Launching ...");
        var title: NSString;
        title = "Pay more attention to do more.";
        window.styleMask = 2;
        window.alphaValue = 0.95;
        window.hasShadow = true;
        window.backgroundColor = NSColor.orangeColor();
        window.setFrame(NSRect(x: 0, y: 0, width: 300, height: 200), display: true);
        window.center();
        label.alignment = .CenterTextAlignment;
        label.backgroundColor = NSColor.clearColor();
        label.textColor = NSColor.whiteColor();
        label.font = NSFont(name:"Arial",size: 14);
        label.frame = NSRect(x: 0, y: 170, width: self.window.frame.width, height: self.window.frame.height);
        
        label.string = title;
        window.contentView.addSubview(label);
        backgroundImage.frame = window.contentView.frame;
        backgroundImage.image = NSImage(named: "tomato");
        window.contentView.addSubview(backgroundImage);
        timeLabel.string = DEFAULT_TIME
        timeLabel.frame = NSRect(x: 0, y: 65, width: self.window.frame.width, height: self.window.frame.height);
        timeLabel.alignCenter(nil);
        timeLabel.textColor = NSColor.whiteColor();
        timeLabel.font = NSFont(name:"Arial",size: 30);
        timeLabel.backgroundColor = NSColor.clearColor();
        window.contentView.addSubview(timeLabel);
        
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "countDown", userInfo: nil, repeats: true);
    }
    
    func countDown () {
        if(!run) {
            return;
        }
        self.window.orderOut(nil);
        if (timeLabel.string.toInt() == 0 ) {
            self.window.orderFront(nil);
            self.myButton.title = "start";
            self.window.level = Int(CGWindowLevelForKey(Int32(kCGScreenSaverWindowLevelKey))) ;
            run = false;
        }
        else {
            let temp = timeLabel.string.toInt()! - 1;
            timeLabel.string = String(temp);
        }
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        self.myButton.title = "stop";
        run = true;
    }
    
}


