//
//  ViewController.swift
//  Emoji Dictionary
//
//  Created by Michael Crump on 2/6/15.
//  Copyright (c) 2015 Michael Crump. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emojiIcon: UILabel!
    @IBOutlet weak var emojiDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        update()
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
    }
    
    func update() {
        let userDefaults = NSUserDefaults(suiteName: "group.net.michaelcrump.emojidictionary")
        //println(userDefaults!.valueForKey("currentEmoji"))
        //println(userDefaults!.valueForKey("currentDescription"))
        userDefaults!.synchronize()
        
        //Add Current Selected Emoji Graphic
        var emoji : AnyObject = userDefaults!.valueForKey("currentEmoji")!
        if let string = emoji as? String {
            emojiIcon.text = string
        }
        
        //Add Current Selected Emoji Description
        var emojiDesc : AnyObject = userDefaults!.valueForKey("currentDescription")!
        if let string = emojiDesc as? String {
            emojiDescription.text = string
        }

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

