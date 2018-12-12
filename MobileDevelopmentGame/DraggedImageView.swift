//
//  DraggedImageView.swift
//  MobileDevelopmentGame
//
//  Created by jm16acu on 06/12/2018.
//  Copyright © 2018 JackMills. All rights reserved.
//

import UIKit

class DraggedImageView: UIImageView {
    var startPos: CGPoint?  // Where I begin; should be a specific X/Y if need be
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startPos = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let currentPos = touches.first?.location(in: self)
        let dx = currentPos!.x - startPos!.x
        let dy = currentPos!.y - startPos!.y
        
        self.center = CGPoint (x: self.center.x + dx, y: self.center.y + dy)
        
    }

}

