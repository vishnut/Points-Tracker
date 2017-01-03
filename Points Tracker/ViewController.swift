//
//  ViewController.swift
//  Points Tracker
//
//  Created by Vishnu Thiagarajan on 5/31/15.
//  Copyright (c) 2015 Vishnu Thiagarajan. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var player1score: UILabel!
    @IBOutlet weak var player2score: UILabel!
    
    var p1score:Int=0
    var p2score:Int=0
    
    @IBOutlet weak var p1label: UILabel!
    @IBOutlet weak var p2label: UILabel!
    @IBOutlet weak var p1winning: UILabel!
    @IBOutlet weak var p2winning: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let storage: UserDefaults = UserDefaults.standard
        let s1:Int?=storage.object(forKey: "1score") as? Int
        let s2:Int?=storage.object(forKey: "2score") as? Int
        let n1:String? = (storage.object(forKey: "p1name") as? String)
        let n2:String? = (storage.object(forKey: "p2name") as? String)
        if(n1 != nil)
        {
            p1label.text=n1
        }
        if(n2 != nil)
        {
            p2label.text=n2
        }
        if(s1 != nil && s2 != nil)
        {
            p1score=s1!
            p2score=s2!
        }
        applychanges()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressReset(_ sender: UIButton) {
        p1score=0
        p2score=0
        applychanges()
    }
    
    func applychanges(){
        player1score.text=String(p1score)
        player2score.text=String(p2score)
        if p1score==p2score{
            p1winning.text=""
            p2winning.text=""
        }
        else if p1score>p2score{
            p1winning.text="_________"
            p2winning.text=""
        }
        else if p1score<p2score{
            p1winning.text=""
            p2winning.text="_________"
        }
    }
    
    @IBAction func p1press(_ sender: UIButton) {
        p1score+=1
        applychanges()
    }

    @IBAction func p2press(_ sender: UIButton) {
        p2score+=1
        applychanges()
    }
    @IBAction func accesssettings(_ sender: UIButton) {
        let storage: UserDefaults = UserDefaults.standard
        storage.set(p1score, forKey: "1score")
        storage.set(p2score, forKey: "2score")
    }
}

