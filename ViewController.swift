//
//  ViewController.swift
//  MobileDevelopmentGame
//
//  Created by jm16acu on 06/12/2018.
//  Copyright © 2018 JackMills. All rights reserved.
//	FINAL CODE - 14/12/2018 - This is the full game with birds coins and game over states

import UIKit

// DEFAULT WIDTH and DEFAULT HEIGHT code
let DW = UIScreen.main.bounds.width
let DH = UIScreen.main.bounds.height




class ViewController: UIViewController {
	
	// Programmatic Player
	
    var dynAnim: UIDynamicAnimator!
    var dynItem: UIDynamicItemBehavior!
	
	
	@IBOutlet var playerView: UIImageView!
	@IBOutlet var gameOverView: UIImageView!
	
	
	
	
	
    // Force override to landscape, even if phone is held vertically
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    

	// Cant get gravity collision
	var PLAYER_SCORE = 0
	
    override func viewDidLoad() {
        super.viewDidLoad()

		view.backgroundColor = UIColor.cyan
		// Add dynamic collisions between player and birds?
		
		
		
		
		
		// Force landscape mode
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
		
		// Player object - Player dims are 12.5% W, 10% H
		let playerView = DraggedImageView(image: UIImage(named: "plane1.png"))
		playerView.frame = CGRect(x: 32, y: DH/2 - (DH * 0.0725), width: DW * 0.125, height: DH * 0.125)
		playerView.isUserInteractionEnabled = true
		
		view.addSubview(playerView)
		
		
		// Gameover screen
		let gameOverView = UIImageView(image: UIImage(named: "replay.png"))
		gameOverView.frame = CGRect(x:DW * 2, y:DH - DH/2, width: DW/2, height: DH/4)
		gameOverView.isUserInteractionEnabled = false
		
		let singleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapDetected))
		singleTap.numberOfTapsRequired = 1;
		gameOverView.addGestureRecognizer(singleTap)
		
		
		
	



		// Road OBJ; Road is W x H
		let roadView = UIImageView(image: UIImage(named:"road1.png"))
		roadView.frame = CGRect(x:0, y:0, width: DW, height: DH)
		view.addSubview(roadView)
		
		let fakeRoad = UIImageView(image: UIImage(named:"road1.png"))
		fakeRoad.frame = CGRect(x:0, y:0, width: DW, height: DH)
		view.addSubview(fakeRoad)
		
		// Tree View; for trees, there are TWO tree images
		let treeView = UIImageView(image: UIImage(named: "tree1.png"))
		treeView.frame = CGRect(x: 0, y: 0, width: DW, height: DH)
		view.addSubview(treeView)
		
		// Tree View; for trees, there are TWO tree images
		let treeView2 = UIImageView(image: UIImage(named: "tree1.png"))
		treeView2.frame = CGRect(x: DW, y: 0, width: DW, height: DH)
		view.addSubview(treeView2)
		
		var birdArray: [BirdCoinLooper] = []
		
		for x in 0...8 {
			let imageView = BirdCoinLooper(image: UIImage(named: "bird1.png"))
			var RNG = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
			
			imageView.frame = CGRect(x: DW + DW * RNG, y: DW * RNG, width: DW * 0.1, height: DH * 0.1)
			
			// add to parent view
			self.view.addSubview(imageView)
			birdArray.append(imageView)
		}
		
		
		
		var coinArray: [BirdCoinLooper] = []
		for x in 0...3 {
			let imageView = BirdCoinLooper(image: UIImage(named: "coin.png"))
			var RNG = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
			imageView.frame = CGRect(x: DW + DW * RNG, y: DH * RNG, width: DW * 0.1, height: DH * 0.1)
			self.view.addSubview(imageView)
			coinArray.append(imageView)
		}

		
		
		

		// IF Game is over, enable the clickbox to make gamestate 0 and reset score
		UIView.animate(withDuration: 3.33, delay: 0.25, options: [UIViewAnimationOptions.repeat, .curveLinear], animations:
			{
				treeView.center.x -= treeView.bounds.width
				
		}, completion: nil
		)
		
		UIView.animate(withDuration: 3.33, delay: 0.25, options: [UIViewAnimationOptions.repeat, .curveLinear], animations:
			{
				treeView2.center.x -= treeView2.bounds.width
				
		}, completion: nil
		)

		view.bringSubview(toFront: playerView)
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
        playerView.image = UIImage.animatedImage(with: playerAnim, duration: 1)
		
		var roadAnim: [UIImage]!
		
		roadAnim = [UIImage(named: "road1.png")!,
		            UIImage(named: "road3.png")!,
		            UIImage(named: "road4.png")!,
		            UIImage(named: "road5.png")!,
		            UIImage(named: "road7.png")!,
		            UIImage(named: "road10.png")!,
		            UIImage(named: "road12.png")!,
		            UIImage(named: "road13.png")!,
		            UIImage(named: "road16.png")!,
		            UIImage(named: "road19.png")!]
		roadView.image = UIImage.animatedImage(with: roadAnim, duration: 0.35)
		
		var birdAnim: [UIImage]!
		
		birdAnim = [
					UIImage(named: "bird1.png")!,
					UIImage(named: "bird2.png")!,
		            UIImage(named: "bird3.png")!,
		            UIImage(named: "bird4.png")!,
		            UIImage(named: "bird5.png")!,
		            UIImage(named: "bird6.png")!,
		            UIImage(named: "bird7.png")!,
		            UIImage(named: "bird8.png")!,
		            UIImage(named: "bird9.png")!,
		            UIImage(named: "bird10.png")!]
		
		
		// For coins and birds, there's a collision that activates based on proximity to the player
		// Both of them fall down; if they're off-screen, it re-teleports them
		
		
		// On every bird, move them left
		for x in birdArray {
			x.image = UIImage.animatedImage(with: birdAnim, duration: 0.3)
			Timer.scheduledTimer(timeInterval: 1/60, target: x, selector: Selector("move"), userInfo: nil, repeats: true)
		}
		
		// Animate coins
		for x in coinArray {
			Timer.scheduledTimer(timeInterval: 1/60, target: x, selector: Selector("move"), userInfo: nil, repeats: true)
			
		}

		// Timer after 20 seconds
		let when = DispatchTime.now() + 20
		DispatchQueue.main.asyncAfter(deadline: when) {
			gameOverView.frame = CGRect(x:DW - DW/2, y:DH - DH/2, width: DW/2, height: DH/4)
			gameOverView.isUserInteractionEnabled = true
			self.view.addSubview(gameOverView)
			self.view.bringSubview(toFront: fakeRoad)
			self.view.bringSubview(toFront: gameOverView)
		}
		
		
    }

	
	
	


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// Literally resets the game
		func tapDetected() {
			self.viewDidLoad()
		}
	
	


}

