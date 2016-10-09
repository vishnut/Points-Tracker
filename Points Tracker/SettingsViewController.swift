//
//  SettingsViewController.swift
//  Points Tracker
//
//  Created by Vishnu Thiagarajan on 6/1/15.
//  Copyright (c) 2015 Vishnu Thiagarajan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var nameShow: UISwitch!
    @IBOutlet weak var player1name: UITextField!
    @IBOutlet weak var player2name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        var storage: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var check=storage.objectForKey("ns")
        if(check != nil)
        {
        nameShow.on=check as! Bool
        }
        player1name.text=storage.objectForKey("p1name") as? String
        player2name.text=storage.objectForKey("p2name") as? String
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneclicked(sender: UIButton) {
        var storage: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        storage.setObject(nameShow.on, forKey: "ns")
        if(nameShow.on)
        {
            if(player1name != nil){
            storage.setObject(player1name.text, forKey: "p1name")
            }
            if(player2name != nil){
            storage.setObject(player2name.text, forKey: "p2name")
            }
        }
        else
        {
            storage.setObject("", forKey: "p1name")
            storage.setObject("", forKey: "p2name")
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
