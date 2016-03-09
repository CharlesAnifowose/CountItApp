//
//  InterfaceController.swift
//  ClickerApp WatchKit Extension
//
//  Created by Christopher Jimenez on 3/8/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    
    @IBOutlet var clickerCountLabel: WKInterfaceLabel!
    
    
    @IBOutlet var clickerCountButton: WKInterfaceButton!
    
    let clickerStorage : ClickerDataStorage = ClickerDataStorage()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        self.clickerCountLabel.setText(String(clickerStorage.getClickerCount()))
        
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

    @IBAction func clickedAddTouched() {
        
        clickerStorage.incrementCount()
        
        self.clickerCountLabel.setText(String(clickerStorage.getClickerCount()))
        
        
    }
}
