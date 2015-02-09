//
//  ZoomEmojiController.swift
//  Emoji Dictionary
//
//  Created by Michael Crump on 2/6/15.
//  Copyright (c) 2015 Michael Crump. All rights reserved.
//

import WatchKit
import Foundation



class ZoomEmojiController: WKInterfaceController {

    @IBOutlet weak var zoomEmojiLabel: WKInterfaceLabel!
    
    @IBOutlet weak var definitionLabel: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var emoji = context as String
        var font = UIFont.systemFontOfSize(80)
        var specialString = NSAttributedString(string: emoji, attributes: [NSFontAttributeName:font])
        zoomEmojiLabel.setAttributedText(specialString)
        
        var definition = "No Definition"
        
        let c : String = emoji
        
       
        let cfstr = NSMutableString(string: String(c)) as CFMutableString
        var range = CFRangeMake(0, CFStringGetLength(cfstr))
        CFStringTransform(cfstr, &range, kCFStringTransformToUnicodeName, 0)
        
        var finalresult = cfstr as String
        
        finalresult = finalresult[advance(finalresult.startIndex,3)..<advance(finalresult.startIndex,countElements(finalresult))]
        
        definitionLabel.setText(finalresult.substringToIndex(finalresult.endIndex.predecessor()))
        
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
