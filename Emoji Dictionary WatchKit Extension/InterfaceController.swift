//
//  InterfaceController.swift
//  Emoji Dictionary WatchKit Extension
//
//  Created by Michael Crump on 2/6/15.
//  Copyright (c) 2015 Michael Crump. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {


    @IBOutlet weak var table: WKInterfaceTable!
    //CTRL-CMD-SPACE
    //var emojis = ["😃", "🎃", "💒"]
    
    var emojis = [""]
    
    let emojiRanges = [
        0x1F601...0x1F64F,
        0x2702...0x27B0,
        0x1F680...0x1F6C0,
        0x1F170...0x1F251
    ]
  
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        for range in emojiRanges {
            for i in range {
                
                emojis.append(String(UnicodeScalar(i)))
            }
        }
        
        self.table.setNumberOfRows(emojis.count, withRowType: "EmojiRow")
        
        for index in 0..<emojis.count {
            var theRow = table.rowControllerAtIndex(index) as EmojiRow
            theRow.emojiRowLabel.setText(emojis[index])
            
        }
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        self.pushControllerWithName("ZoomEmojiController", context: emojis[rowIndex])
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
