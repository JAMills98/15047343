//
//  ViewController.swift
//  MobileDevelopmentGame
//
//  Created by jm16acu on 06/12/2018.
//  Copyright © 2018 JackMills. All rights reserved.
//	FINAL CODE - 14/12/2018 - This is the full game with birds coins and game over states


// DEFAULT MODE - IPHONE 7; BUT IT CAN SCALE APPROPRIATELY

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
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		var PLAYER_SCORE = 0
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
		
		let fakeRoad = UIImageView(image: UIImage(named:"road1.png"))
		fakeRoad.frame = CGRect(x:0, y:0, width: DW, height: DH)
		view.addSubview(fakeRoad)
		
		// Gameover screen
		let gameOverView = UIImageView(image: UIImage(named: "replay.png"))
		gameOverView.frame = CGRect(x:DW * 2, y:DH - DH/2, width: DW/2, height: DH/4)
		gameOverView.isUserInteractionEnabled = false
		
		let singleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapDetected))
		singleTap.numberOfTapsRequired = 1;
		gameOverView.addGestureRecognizer(singleTap)
		
		
		// Player Score
		let scoreView = UILabel()
		scoreView.textAlignment = .center
		scoreView.frame = CGRect(x: 0, y: 0, width: DW, height: DH/8)
		scoreView.text = "SCORE: " + String(PLAYER_SCORE)
		
		view.addSubview(scoreView)
		
		// Road OBJ; Road is W x H
		let roadView = UIImageView(image: UIImage(named:"road1.png"))
		roadView.frame = CGRect(x:0, y:0, width: DW, height: DH)
		view.addSubview(roadView)
		
		let roadView2 = UIImageView(image: UIImage(named:"road1.png"))
		roadView2.frame = CGRect(x:DW, y:0, width: DW, height: DH)
		roadView2.transform = CGAffineTransform(scaleX: -1, y: 1)
		view.addSubview(roadView2)
		
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
		view.bringSubview(toFront: scoreView)
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
		
		
		// WARNING - THIS CODE IS CURSED: I dont know how it does it, but it just SOMETIMES doesn't work properly, and I mean it. IF the road is bugging up a lot, I'll make it scroll instead.
		
		// INSTEAD, IM MAKING IT SCROLL; YOU'LL SEE A SEAM BUT I CAN'T DO ANYTHING
		
		/* var roadAnim: [UIImage]!
		roadAnim = [UIImage(named: "road1.png")!,
		            UIImage(named: "road3.png")!,
		            UIImage(named: "road4.png")!,
		            UIImage(named: "road5.png")!,
		            UIImage(named: "road7.png")!,
		            UIImage(named: "road10.png")!,
		            UIImage(named: "road12.png")!,
		            UIImage(named: "road13.png")!,
		            UIImage(named: "road16.png")!,
		            UIImage(named: "road18.png")!]
		roadView.image = UIImage.animatedImage(with: roadAnim, duration: 0.35)
		
		*/
		
		
		// Road just scrolls
		UIView.animate(withDuration: 3.33, delay: 0.25, options: [UIViewAnimationOptions.repeat, .curveLinear], animations:
			{
				roadView.center.x -= roadView.bounds.width
				
		}, completion: nil
		)
		
		UIView.animate(withDuration: 3.33, delay: 0.25, options: [UIViewAnimationOptions.repeat, .curveLinear], animations:
			{
				roadView2.center.x -= roadView2.bounds.width
				
		}, completion: nil
		)
		
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
		
		// Animate coins
		Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { (Timer) in
			
			
			for x in coinArray {
				x.move()
				
				// IF my bounds are in the player's, then teleport me back
				if (x.frame.intersects(playerView.frame)) {
					x.teleport()
					PLAYER_SCORE += 100
				}
			}
			
			
			for x in birdArray {
				
				x.image = UIImage.animatedImage(with: birdAnim, duration: 0.35)
				
				if (x.isIntagiable) {
					x.fall()
				}
				
				else {
					x.move()
				}
				
				// IF my bounds are in the player's, then teleport me back
				if (x.frame.intersects(playerView.frame)) {
					
					if (!x.isIntagiable) {
						PLAYER_SCORE -= 100
					}
					x.isIntagiable = true
				}
			}
			
			scoreView.text = "SCORE: " + String(PLAYER_SCORE)
			
			
			
		}
		

		// Timer after 20 seconds
		var when = DispatchTime.now() + 20
		DispatchQueue.main.asyncAfter(deadline: when) {
			gameOverView.frame = CGRect(x:DW - DW/2, y:DH - DH/2, width: DW/2, height: DH/4)
			gameOverView.isUserInteractionEnabled = true
			self.view.addSubview(gameOverView)
			self.view.bringSubview(toFront: fakeRoad)
			self.view.bringSubview(toFront: gameOverView)
			
			// Display player's duplicate score in BG
			let fakeScore = UILabel()
			fakeScore.textAlignment = .center
			fakeScore.frame = CGRect(x:0, y: DH * 0.2, width: DW, height: DH/8)
			fakeScore.text = "Your Final Score: " + String(PLAYER_SCORE)
			self.view.addSubview(fakeScore)
			
		}
		
		
    }

	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	// Literally resets the game
		func tapDetected() {
			self.viewDidLoad()
			//ViewController.when = DispatchTime.now() + 20
			//Timer.invalidate(Timer)
		}
	
	


}

