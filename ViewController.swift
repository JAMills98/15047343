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
	
	
	
    // Force override to landscape, even if phone is held vertically
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    

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
		
		
		
		// Road OBJ; Road is W x H
		let roadView = UIImageView(image: UIImage(named:"road1.png"))
		roadView.frame = CGRect(x:0, y:0, width: DW, height: DH)
		view.addSubview(roadView)
		
		// Tree View; for trees, there are TWO tree images
		let treeView = UIImageView(image: UIImage(named: "tree1.png"))
		treeView.frame = CGRect(x: 0, y: 0, width: DW, height: DH)
		view.addSubview(treeView)
		
		// Tree View; for trees, there are TWO tree images
		let treeView2 = UIImageView(image: UIImage(named: "tree1.png"))
		treeView2.frame = CGRect(x: DW, y: 0, width: DW, height: DH)
		view.addSubview(treeView2)
		
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
		
		
		var birdArray: [BirdCoinLooper] = []

		for x in 0...6 {
			let imageView = BirdCoinLooper(image: UIImage(named: "bird1.png"))
			var RNG = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
			
			imageView.frame = CGRect(x: DW + DW * RNG, y: DW * RNG, width: DW * 0.1, height: DH * 0.1)
			
			// add to parent view
			self.view.addSubview(imageView)
			birdArray.append(imageView)
		}
		
		
		
		var coinArray: [BirdCoinLooper] = []
		for x in 0...4 {
			let imageView = BirdCoinLooper(image: UIImage(named: "coin.png"))
			var RNG = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
			imageView.frame = CGRect(x: DW + DW * RNG, y: DH * RNG, width: DW * 0.1, height: DH * 0.1)
			self.view.addSubview(imageView)
			coinArray.append(imageView)
		}

		
        // Timer Code
        let when = DispatchTime.now() + 20
        DispatchQueue.main.asyncAfter(deadline: when) {
            // This is the timeOver Code
        }
		
		
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
		
		
		// On every bird, move them left
		for x in birdArray {
			x.image = UIImage.animatedImage(with: birdAnim, duration: 0.3)
			Timer.scheduledTimer(timeInterval: 1/60, target: x, selector: Selector("move"), userInfo: nil, repeats: true)
		}
		
		// Animate coins
		for x in coinArray {
			Timer.scheduledTimer(timeInterval: 1/20, target: x, selector: Selector("move"), userInfo: nil, repeats: true)
			
		}
		
		
		
    }

	


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

