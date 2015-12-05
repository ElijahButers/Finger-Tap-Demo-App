//
//  InterfaceController.swift
//  Watch-FingerTapDemoApp WatchKit Extension
//
//  Created by User on 12/5/15.
//  Copyright © 2015 Elijah Buters. All rights reserved.
//

import WatchKit
import Foundation

var kBestScore = 0

class InterfaceController: WKInterfaceController {
    
    // Outlets
    @IBOutlet var timeLeftLabel: WKInterfaceLabel!
    @IBOutlet var buttonTap: WKInterfaceButton!
    @IBOutlet var startButton: WKInterfaceButton!
    @IBOutlet var bestScoreLabel: WKInterfaceLabel!
    
    var timer = NSTimer()
    var count = 10
    var tapCount = 0
    let defaults = NSUserDefaults()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        self.buttonTap.setEnabled(false)
        getBestScore()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // Actions
    @IBAction func buttonTapped() {
        tapCount += 1
        self.buttonTap.setTitle("\(tapCount)")
        getBestScore()
    }
    
    @IBAction func startTapped() {
        start()
        self.buttonTap.setEnabled(true)
        self.startButton.setEnabled(false)
    }
    
    @IBAction func resetTapped() {
        stop()
        count = 10
        tapCount = 0
        self.timeLeftLabel.setText("\(count) sec")
        self.buttonTap.setTitle("Tap!")
        self.buttonTap.setEnabled(false)
        self.startButton.setEnabled(true)
    }
    
    func start() {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
    }
    
    func stop() {
        
        timer.invalidate()
    }
    
    func result() {
        
        if count == 0 {
            self.buttonTap.setEnabled(false)
            self.timeLeftLabel.setText("\(count) sec")
        } else {
            count--
            self.timeLeftLabel.setText("\(count) sec")
        }
        
    }
    
    func getBestScore() {
        
        if defaults.objectForKey("kBestScore") == nil {
            let zero = 0
            defaults.setObject(zero, forKey: "kBestScore")
            defaults.synchronize()
        } else {
            let score: Int = defaults.objectForKey("kBestScore") as! Int
            
            if tapCount > score {
                defaults.setObject(tapCount, forKey: "kBestScore")
                defaults.synchronize()
                self.bestScoreLabel.setText("Best score: \(tapCount)")
            } else {
                self.bestScoreLabel.setText("BestScore: \(score)")
            }
        }
    }

}


















