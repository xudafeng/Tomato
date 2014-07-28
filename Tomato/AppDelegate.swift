//
//  AppDelegate.swift
//  Tomato
//
//  Created by xdf on 7/25/14.
//  Copyright (c) 2014 xdf. All rights reserved.
//

import Cocoa;

class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow?
    @IBOutlet var myButton: NSButton?
    
    var time = NSText();
    var label = NSText();
    var isRun = false;
    var seconds = NSDate.timeIntervalSinceReferenceDate();
    let DEFAULT_TIME = 60 * 25;
    let TITLE = "Pay More Attention To Do More.";
    
    
    func setWindowView (container:NSWindow) {
        var image = NSImageView()
        image.frame = container.contentView!.frame;
        image.image = NSImage(named: "tomato");
        container.contentView!.addSubview(image);
        container.styleMask = 2;
        container.alphaValue = 0.95;
        container.hasShadow = true;
        container.backgroundColor = NSColor.orangeColor();
        container.setFrame(NSRect(x: 0, y: 0, width: 300, height: 200), display: true);
        container.center();
    }
    
    func setLabelView (title:NSString) {
        label.alignment = .CenterTextAlignment;
        label.backgroundColor = NSColor.clearColor();
        label.textColor = NSColor.whiteColor();
        label.font = NSFont(name:"Arial",size: 14);
        label.frame = NSRect(x: 0, y: 170, width: self.window!.frame.width, height: self.window!.frame.height);
        label.string = title;
        self.window!.contentView!.addSubview(label);
    }
    
    func setTimeLabelView (container:NSWindow) {
        var time = self.time;
        time.string = formatTime2String(DEFAULT_TIME);
        time.frame = NSRect(x: 0, y: 60, width: container.frame.width, height: container.frame.height);
        time.alignCenter(nil);
        time.textColor = NSColor.whiteColor();
        time.font = NSFont(name:"Arial", size: 30);
        time.backgroundColor = NSColor.clearColor();
        container.contentView!.addSubview(time);
    }
    
    func startTimer () {
         NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "countDownLoop", userInfo: nil, repeats: true);
    }
    
    func orderOutTimer () {
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "orderOutWindow", userInfo: nil, repeats: false);
    }
    
    func orderOutWindow () {
        self.window?.orderOut(nil);
    }
    
    func formatTime2String (int: NSInteger)  -> NSString{
        var minute = int/60;
        var sminute = String(minute);
        if (countElements(String(minute)) == 1) {
            sminute = "0" + sminute;
        }
        
        var view = sminute + ":";
        var temp = String(int - minute * 60);

        if (countElements(temp) == 1) {
            temp = "0" + temp;
        }
        view += temp;
        return  String(view);
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        NSLog ("\nApp Start Launching ...");
        setWindowView(self.window!);
        setLabelView(TITLE);
        setTimeLabelView(self.window!);
        startTimer();
    }
    
    func countDownLoop () {
        if(!isRun) {
            return;
        }
        let current = NSDate.timeIntervalSinceReferenceDate();
        let passedTime = Int(round(current - seconds));
        let showTime = DEFAULT_TIME - passedTime;

        if(showTime <= 0) {
            self.window!.orderFront(nil);
            time.string = formatTime2String(DEFAULT_TIME);
            self.myButton?.title = "start";
            self.myButton?.hidden = false;
            self.label.string = TITLE;
            self.window?.level = Int(CGWindowLevelForKey(Int32(kCGScreenSaverWindowLevelKey)));
            isRun = false;
        } else {
            time.string = formatTime2String(showTime);
        }
    }

    @IBAction func buttonTapped(sender: AnyObject) {
        self.label.string = "3 seconds to prepare";
        self.myButton?.hidden = true;
        isRun = true;
        orderOutTimer();
        seconds = NSDate.timeIntervalSinceReferenceDate();
    }
}


