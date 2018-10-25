//
//  ViewController.swift
//  Assignment Game
//
//  Created by jm16acu on 25/10/2018.
//  Copyright © 2018 JAMills. All rights reserved.
//

import UIKit


public var dw: CGFloat {
    return UIScreen.main.bounds.width
}

public var dh: CGFloat {
    return UIScreen.main.bounds.height
}


// Player can only move vertically
class PLAYER {
    let xPos = dw/16
    let yPos = dh/2
}


// Game Vars
var GAME_MODE = 0 // 0 - Main Menu Select | 1 = Game | 2 = Options Menu

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

