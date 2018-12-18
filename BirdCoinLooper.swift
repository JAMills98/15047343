//
//  BirdCoinLooper.swift
//  MobileDevelopmentGame
//
//  Created by jm16acu on 14/12/2018.
//  Copyright © 2018 JackMills. All rights reserved.
//  Purpose: This is the code that loops over birds and coins; because they share code, but different collision beheaviour
//  Function: First, spawn them somewhere off the right side of the screen, then constantly move them left at a random speed; once my X is -WIDTH, Teleport back again

import UIKit

class BirdCoinLooper: UIImageView {

    
    var movX = CGFloat(arc4random_uniform(4) + 2);
    var isIntagiable = false
    
    // Per frame; move me a random amount to the left
    func move() {
        self.center = CGPoint (x: self.center.x - movX, y: self.center.y)
        if (self.center.x < 0 - self.bounds.width) {
            self.teleport()
        }
        
            }
    // IF I collide with the player, I fall down

    func fall() {
        
        self.alpha -= 1/64
        self.center = CGPoint (x: self.center.x - movX, y: self.center.y + movX)
        
        
        if (self.center.y > DH) {
            self.teleport()
        }
    }
    
    func teleport() {
        
        // Randomly put crow somewhere in the 1/4 Screen Size off screen
        self.center.x = DW + DW * CGFloat(Float(arc4random()) / Float(UINT32_MAX)) // DW +  //CGFloat(arc4random_uniform(UInt32(DW/4)))
        
        // Additionally, randomly place their YPos and yes there's tons of converstion
        self.center.y = CGFloat(arc4random_uniform(UInt32(DH - (self.bounds.height * 2))) + UInt32(self.bounds.height))
        
        // AND, Also randomize movespeed
        self.movX = CGFloat(arc4random_uniform(5) + 3);
        
        self.isIntagiable = false;
        
        self.alpha = 1;
        
    }

    
}

