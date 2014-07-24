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
    

    var time = NSText();
    var isRun = false;
    let DEFAULT_TIME = 25 * 60;
    
    func setWindowView (container:NSWindow) {
        var image = NSImageView()
        image.frame = container.contentView.frame;
        image.image = NSImage(named: "tomato");
        container.contentView.addSubview(image);
        container.styleMask = 2;
        container.alphaValue = 0.95;
        container.hasShadow = true;
        container.backgroundColor = NSColor.orangeColor();
        container.setFrame(NSRect(x: 0, y: 0, width: 300, height: 200), display: true);
        container.center();
    }
    
    func setLabelView (title:NSString) {
        var label = NSText();
        label.alignment = .CenterTextAlignment;
        label.backgroundColor = NSColor.clearColor();
        label.textColor = NSColor.whiteColor();
        label.font = NSFont(name:"Arial",size: 14);
        label.frame = NSRect(x: 0, y: 170, width: self.window.frame.width, height: self.window.frame.height);
        label.string = title;
        self.window.contentView.addSubview(label);
    }
    
    func setTimeLabelView (container:NSWindow) {
        var time = self.time;
        time.string = formatTime(DEFAULT_TIME);
        time.frame = NSRect(x: 0, y: 60, width: container.frame.width, height: container.frame.height);
        time.alignCenter(nil);
        time.textColor = NSColor.whiteColor();
        time.font = NSFont(name:"Arial", size: 30);
        time.backgroundColor = NSColor.clearColor();
        container.contentView.addSubview(time);
    }
    
    func startTimer () {
         NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "countDownLoop", userInfo: nil, repeats: true);
    }
    
    func startCountDown () {
    
    }
    
    func recetCountDown () {
        
    }
    
    func formatTime (int: NSInteger)  -> NSString{
        var minute = int/60;
        var view = String(minute) + ":";
        var temp = String(int - minute * 60);
        
        if (countElements(temp) == 1) {
            temp = "0" + temp;
        }
        view += temp;
        return  view;
    }
    
    func convertTime (str: NSString) -> NSInteger{
        let array = split("str") {
            $0 == ":"
        }
        var numb = (array[0].toInt()!) * 60 + (array[1].toInt()!);
        println(numb);
        return numb;
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        NSLog ("\nApp Start Launching ...");
        setWindowView(self.window);
        setLabelView("Pay More Attention To Do More.");
        setTimeLabelView(self.window);
        startTimer();
    }
    
    func countDownLoop () {
        if(!isRun) {
            return;
        }
        //self.window.orderOut(nil);
        if (convertTime(time.string) == 0) {
            self.window.orderFront(nil);
            self.myButton.title = "start";
            self.myButton.hidden = false;
            self.window.level = Int(CGWindowLevelForKey(Int32(kCGScreenSaverWindowLevelKey))) ;
            isRun = false;
        }
        else {
            let temp = convertTime(time.string) - 1;
            time.string = formatTime(temp);
        }
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        self.myButton.hidden=true
        if(!isRun) {
            isRun = true;
            time.string = formatTime(DEFAULT_TIME);
        }
    }
    
}


