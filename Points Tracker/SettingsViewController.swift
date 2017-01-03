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
    @IBOutlet weak var p1changescore: UITextField!
    @IBOutlet weak var p2changescore: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let storage: UserDefaults = UserDefaults.standard
        let check=storage.object(forKey: "ns")
        if(check != nil)
        {
        nameShow.isOn=check as! Bool
        }
        player1name.text=storage.object(forKey: "p1name") as? String
        player2name.text=storage.object(forKey: "p2name") as? String
        p1changescore.text=storage.object(forKey: "1score") as? String
        p2changescore.text=storage.object(forKey: "2score") as? String
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneclicked(_ sender: UIButton) {
        let storage: UserDefaults = UserDefaults.standard
        storage.set(nameShow.isOn, forKey: "ns")
        if(nameShow.isOn)
        {
            if(player1name != nil){
            storage.set(player1name.text, forKey: "p1name")
            }
            if(player2name != nil){
            storage.set(player2name.text, forKey: "p2name")
            }
        }
        else
        {
            storage.set("", forKey: "p1name")
            storage.set("", forKey: "p2name")
        }

        let sp1 = Int(p1changescore.text!)
        if(sp1 != nil)
        {
            storage.set(sp1, forKey: "1score")
        }
        let sp2 = Int(p2changescore.text!)
        if(sp2 != nil)
        {
            storage.set(sp2, forKey: "2score")
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
