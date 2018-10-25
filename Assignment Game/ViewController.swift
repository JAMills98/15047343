//
//  ViewController.swift
//  Assignment Game
//
//  Created by jm16acu on 25/10/2018.
//  Copyright © 2018 JAMills. All rights reserved.
// TODO - We're getting spec next week but go Copy some templates and bullshit

import UIKit


public var dw: CGFloat {
    return UIScreen.main.bounds.width
}

public var dh: CGFloat {
    return UIScreen.main.bounds.height
}



// Player can only move vertically
class PLAYER: UIImageView {
    
    var startLoc: CGPoint?
    
    var xPos = dw/16
    var yPos = dh/2

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startLoc = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.yPos = (touches.first?.location(in: self).y)! - startLoc!.y
        self.center = CGPoint(x: xPos, y: yPos)
    }
    
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

