//
//  ViewController.swift
//  Chopin Player
//
//  Created by Isaac Granillo on 12/2/15.
//  Copyright © 2015 Isaac Granillo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    
    @IBOutlet var volumeSlider: UISlider!
    
    @IBOutlet var scrubSlider: UISlider!
    
    
    @IBAction func play(sender: AnyObject) {
        
        player.play()
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
    }
    
    
    @IBAction func stop(sender: AnyObject) {
        
        player.stop()
        
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("chopin", ofType: "mp3")!))
            
        }
            
        catch {
            
            //did not work
        }
        
        
    }
    
    
    @IBAction func adjustVolume(sender: AnyObject) {
        
        player.volume = volumeSlider.value 
    }
   
    
    @IBAction func scrub(sender: AnyObject) {
        
        player.currentTime = NSTimeInterval(scrubSlider.value)
        
    }
    
    func updateScrubSlider() {
        scrubSlider.value = Float(player.currentTime)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("chopin", ofType: "mp3")!))
            
                scrubSlider.maximumValue = Float(player.duration)
            
        }
        
        catch {
            
            //did not work
        }
        
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateScrubSlider"), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

