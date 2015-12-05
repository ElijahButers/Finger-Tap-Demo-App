//
//  InterfaceController.swift
//  Watch-FingerTapDemoApp WatchKit Extension
//
//  Created by User on 12/5/15.
//  Copyright © 2015 Elijah Buters. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    // Outlets
    @IBOutlet var leftTimeLabel: WKInterfaceLabel!
    @IBOutlet var buttonTap: WKInterfaceButton!
    @IBOutlet var startButton: WKInterfaceButton!
    @IBOutlet var bestScoreLabel: WKInterfaceLabel!
    
    

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
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
    }
    
    @IBAction func startTapped() {
    }
    
    @IBAction func resetTapped() {
    }

}
