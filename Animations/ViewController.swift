//
//  ViewController.swift
//  Animations
//
//  Created by Ross on 07/06/2017.
//  Copyright © 2017 Braaaaap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func fadeIn(_ sender: Any) {
    
    image.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {
            
            self.image.alpha = 1
            
        })
    }
    
    @IBAction func SlideIn(_ sender: Any) {
        
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        UIView.animate(withDuration: 2) {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        }
    }
    
    
    @IBAction func Grow(_ sender: Any) {
        
        self.image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1) {
            
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        }
    }
    
    @IBOutlet weak var start: UIButton!
    
    @IBOutlet weak var image: UIImageView!
    
    
    var counter = 0
    
    var timer = Timer()
    
    var isAnimating = false
    
    func animate() {
        
        image.image = UIImage(named: "frame_\(counter)_delay-0.07s.gif")
        
        counter += 1
        
        if counter == 25 {
            
            counter = 0
            
//            timer.invalidate()
//            isAnimating = false
            
        }
    

    }
    
    @IBAction func next(_ sender: UIButton) {
        
        if isAnimating {
            
            timer.invalidate()
            start.setTitle("Start Animation", for: [])
            isAnimating = false

        
        } else {
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo:nil, repeats: true)
            
            start.setTitle("Stop Animation", for: [])
            isAnimating = true
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//NSArray *imageNames = @[@"win_1.png", @"win_2.png", @"win_3.png", @"win_4.png",
//@"win_5.png", @"win_6.png", @"win_7.png", @"win_8.png",
//@"win_9.png", @"win_10.png", @"win_11.png", @"win_12.png",
//@"win_13.png", @"win_14.png", @"win_15.png", @"win_16.png"];
//
//NSMutableArray *images = [[NSMutableArray alloc] init];
//for (int i = 0; i < imageNames.count; i++) {
//    [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
//}
//
//// Normal Animation
//UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 95, 86, 193)];
//animationImageView.animationImages = images;
//animationImageView.animationDuration = 0.5;
//
//[self.view addSubview:animationImageView];
//[animationImageView startAnimating];
