//
//  ViewController.swift
//  MobileDevelopmentGame
//
//  Created by jm16acu on 06/12/2018.
//  Copyright © 2018 JackMills. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    //@IBOutlet weak var playerView: UIImageView!
    @IBOutlet weak var birdView: UIImageView!
    @IBOutlet weak var roadView = UIImageView(image: nil)
    @IBOutlet weak var treeView = UIImageView(image: nil)
    @IBOutlet weak var treeView2 = UIImageView(image: nil)
    @IBOutlet weak var treeView3 = UIImageView(image: nil)
    @IBOutlet weak var houseView: UIImageView!
    @IBOutlet weak var coinView: UIImageView!
    @IBOutlet weak var explosionView: UIImageView!
    @IBOutlet weak var hudView: UIImageView!
    @IBOutlet weak var playerView = UIImageView(image: nil)
    var dynAnim: UIDynamicAnimator!
    var dynItem: UIDynamicItemBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load screen and make the size fit the screen; this will stretch the image based off the iphone 7
        self.view.backgroundColor = UIColor.cyan

        // Scroll the trees
        UIView.animate(withDuration: 3.33, delay: 0.25, options: [UIViewAnimationOptions.repeat, .curveLinear], animations:
            {
                self.treeView?.center.x -= (self.treeView?.bounds.width)!
                
        }, completion: nil
        )
        
        // Magic hack; im a noob and i cant duplicate the trees so i just cloned the array and scroll func to a seperate offset tree to imaine looping
        UIView.animate(withDuration: 3.33, delay: 0.25, options: [UIViewAnimationOptions.repeat, .curveLinear], animations:
            {
                self.treeView2?.center.x -= (self.treeView2?.bounds.width)!
                
        }, completion: nil
        )
        
        // Magic hack; im a noob and i cant duplicate the trees so i just cloned the array and scroll func to a seperate offset tree to imaine looping
        UIView.animate(withDuration: 3.33, delay: 0.25, options: [UIViewAnimationOptions.repeat, .curveLinear], animations:
            {
                self.treeView3?.center.x -= (self.treeView3?.bounds.width)!
                
        }, completion: nil
        )
        
        
        // Update the player; cycles the sprite through the player's animation array.
        var playerAnim: [UIImage]!

        playerAnim = [UIImage(named: "plane1.png")!,
                      UIImage(named: "plane2.png")!,
                      UIImage(named: "plane3.png")!,
                      UIImage(named: "plane4.png")!,
                      UIImage(named: "plane5.png")!,
                      UIImage(named: "plane6.png")!,
                      UIImage(named: "plane7.png")!,
                      UIImage(named: "plane8.png")!,
                      UIImage(named: "plane9.png")!,
                      UIImage(named: "plane10.png")!,
                      UIImage(named: "plane11.png")!,
                      UIImage(named: "plane12.png")!,
                      UIImage(named: "plane13.png")!,
                      UIImage(named: "plane14.png")!,
                      UIImage(named: "plane15.png")!]
        playerView?.image = UIImage.animatedImage(with: playerAnim, duration: 1)
        
        
        // WHY are roads so buggy yo dont understand
        var roadAnim: [UIImage]!
        
        roadAnim = [UIImage(named: "road2.png")!,
                      UIImage(named: "road3.png")!,
                      UIImage(named: "road4.png")!,
                      UIImage(named: "road5.png")!,
                      UIImage(named: "road7.png")!,
                      UIImage(named: "road10.png")!,
                      UIImage(named: "road11.png")!,
                      UIImage(named: "road12.png")!,
                      UIImage(named: "road13.png")!,
                      UIImage(named: "road14.png")!,
                      UIImage(named: "road16.png")!,
                      UIImage(named: "road17.png")!,
                      UIImage(named: "road18.png")!,
                      UIImage(named: "road19.png")!]
        roadView?.image = UIImage.animatedImage(with: roadAnim, duration: 0.35)
        
        
        // Crows - A crow is a templated OBJ with a hitbox; IF A CROW collides with player, player becomes invuln and loses score
        // TODO Next - IF we can add crows, we can likely add coins too.
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

