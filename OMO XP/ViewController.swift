//
//  ViewController.swift
//  OMO XP
//
//  Created by Casper Castellini on 4/6/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBAction func skip(_ sender: Any) {
    }

    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Path of video
        let theURL = Bundle.main.url(forResource: "quilonvid", withExtension: "mp4")
        
        avPlayer = AVPlayer(url: theURL!) // Creates avPlayer based on path
        avPlayerLayer = AVPlayerLayer(player: avPlayer) // Creates a layer to present avPlayer
        avPlayerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill // Set frame, repeat count and scale mode for this layer
        avPlayer.volume = 0
        avPlayer.actionAtItemEnd = .none
        
        
        avPlayerLayer.frame = view.layer.bounds
        view.backgroundColor = .clear
        self.view.layer.insertSublayer(avPlayerLayer, at: 0) // Add view from this layer to view
        
        // Retracts avPlayer from notification of when the avPlayer has reached its end - to ready video to loop
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avPlayer.currentItem)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: kCMTimeZero)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        avPlayer.play()
        paused = false
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        avPlayer.pause()
        paused = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

