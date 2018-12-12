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
    @IBOutlet weak var birdView = UIImageView(image: nil)
    @IBOutlet weak var birdView2 = UIImageView(image: nil)
    @IBOutlet weak var birdView3 = UIImageView(image: nil)
    @IBOutlet weak var birdView4 = UIImageView(image: nil)
    
    // Test a bird array
    
    
    // Coins that show on screen
    @IBOutlet weak var coinView: UIImageView!
    @IBOutlet weak var coinView2: UIImageView!
    @IBOutlet weak var coinView3: UIImageView!
    
    @IBOutlet weak var roadView = UIImageView(image: nil)
    @IBOutlet weak var treeView = UIImageView(image: nil)
    @IBOutlet weak var treeView2 = UIImageView(image: nil)
    @IBOutlet weak var treeView3 = UIImageView(image: nil)
    @IBOutlet weak var houseView: UIImageView!
    
    @IBOutlet weak var explosionView: UIImageView!
    @IBOutlet weak var hudView: UIImageView!
    @IBOutlet weak var playerView = UIImageView(image: nil)
    var dynAnim: UIDynamicAnimator!
    var dynItem: UIDynamicItemBehavior!

    
    // Force override to landscape, even if phone is held vertically
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        // Timer Code
        let when = DispatchTime.now() + 20
        DispatchQueue.main.asyncAfter(deadline: when) {
            // This is the timeOver Code
        }
        
        
        // Load screen and make the size fit the screen; this will stretch the image based off the iphone 7
        let W = UIScreen.main.bounds.width
        let H = UIScreen.main.bounds.height
        
        self.view.backgroundColor = UIColor.cyan
        
        // Make player absolute front object
        self.view.bringSubview(toFront: playerView!)
        

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
        // I KNOW you can probably put them in an array but Swift Sucks and i think it would just make the same object multiple times.
        UIView.animate(withDuration: 3.33, delay: 0.25, options: [UIViewAnimationOptions.repeat, .curveLinear], animations:
            {
                self.treeView3?.center.x -= (self.treeView3?.bounds.width)!
        }, completion: nil
        )
        
        // ITS A FEATURE! Limit of 4 birds in total
        // Birds work like so:
        // IF I collide with the player, they start flashing and they become temproarily invulnerable
        // IF I go off the left side of the screen, I teleport back to the start
        // The code works like this: When the animation loop occurs, set X to a backwards and a random number,
        
            UIView.animate(withDuration: 3, delay: 0.25, options: [UIViewAnimationOptions.repeat, .curveLinear], animations: {self.birdView?.center.x -= W + CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.width)) + 1); self.birdView?.center.y = CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.height)) + 1)}, completion:nil)
        
        
        
        
		UIView.animate(withDuration: 3, delay: 0.25, options: [UIViewAnimationOptions.repeat, .curveLinear], animations: {self.birdView2?.center.x -= W + CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.width)) + 1)}, completion:nil)
        UIView.animate(withDuration: 3, delay: 0.25, options: [UIViewAnimationOptions.repeat, .curveLinear], animations: {self.birdView3?.center.x -= W + CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.width)) + 1)}, completion:nil)
        UIView.animate(withDuration: 3, delay: 0.25, options: [UIViewAnimationOptions.repeat, .curveLinear], animations: {self.birdView4?.center.x -= W + CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.width)) + 1)}, completion:nil)
        
        
        
        
        // ITS A FEATURE! Limit of 3 coins, too
        // Coins work like this:
        // IF I collide with the player, I fade out and gravity fall
        // IF my alpha is 0, I teleport back to a random position, set alpha to 1, then move left and disable gravity.
        
        

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
        
        
        var birdAnim = [UIImage(named: "bird1.png")!,
                        UIImage(named: "bird2.png")!,
                        UIImage(named: "bird3.png")!,
                        UIImage(named: "bird4.png")!,
                        UIImage(named: "bird5.png")!,
                        UIImage(named: "bird6.png")!,
                        UIImage(named: "bird7.png")!,
                        UIImage(named: "bird8.png")!,
                        UIImage(named: "bird9.png")!,
                        UIImage(named: "bird10.png")!]
        
        birdView?.image = UIImage.animatedImage(with: birdAnim, duration: 0.35)
		birdView2?.image = UIImage.animatedImage(with: birdAnim, duration: 0.35)
		birdView3?.image = UIImage.animatedImage(with: birdAnim, duration: 0.35)
		birdView4?.image = UIImage.animatedImage(with: birdAnim, duration: 0.35)
        
        // Crows - A crow is a templated OBJ with a hitbox; IF A CROW collides with player, player becomes invuln and loses score
        // TODO Next - IF we can add crows, we can likely add coins too.
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

