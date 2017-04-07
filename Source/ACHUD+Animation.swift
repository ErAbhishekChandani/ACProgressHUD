//
//  ACProgressHUD+Animation.swift
//  ACProgressHUD
//
//  Created by Er. Abhishek Chandani on 02/04/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import Foundation
import UIKit

//MARK:- Show Animation Structure
public enum ACHudShowAnimation : Int {

    case growIn = 0
    case shrinkIn
    case bounceIn
    case zoomInOut
    case slideFromTop
    case bounceFromTop
    case none

}

//MARK:- Dismiss Animation Structure
public enum ACHudDismissAnimation : Int {
    
    case growOut = 0
    case shrinkOut
    case fadeOut
    case bounceOut
    case slideToTop
    case slideToBottom
    case bounceToTop
    case bounceToBottom
    case none

}

//MARK:-------------------------HUD SHOW ANIMATION METHOD--------------------------
extension ACProgressView {
    
    func growIn() -> Void {
        
        hudView.isHidden = false
        hudView.alpha = 0.1;
        hudView.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
        
        UIView.animate(withDuration: 0.2, delay: 0, options:  UIViewAnimationOptions(rawValue: 458752), animations: {
            
            self.hudView.alpha = 1.0;
            self.hudView.transform = CGAffineTransform.identity;
            
            }, completion: nil)
        
    }
    
    func shrinkIn() -> Void {
        
        hudView.isHidden = false
        hudView.alpha = 0.0;
        hudView.transform = CGAffineTransform.init(scaleX: 1.50, y: 1.50)
        
        UIView.animate(withDuration: 0.2, delay: 0, options:  UIViewAnimationOptions(rawValue: 458752), animations: {
            
            self.hudView.alpha = 1.0;
            self.hudView.transform = CGAffineTransform.identity;
            
            }, completion: nil)
        
    }
    
    func slideFromTop() -> Void {
        
        hudView.isHidden = false
        hudView.transform = CGAffineTransform.identity
        var startFrame = hudView.frame;
        let finalFrame = startFrame
        startFrame.origin.y = -hudView.frame.height
        hudView.frame = startFrame;
        
        UIView.animate(withDuration: 0.30, delay: 0, options: UIViewAnimationOptions(rawValue: 458752), animations: {
            self.hudView.frame = finalFrame;
            
            }, completion: nil)
        
    }
    
    func zoomInZoomOut() {
        
        hudView.isHidden = false
        hudView.transform = CGAffineTransform.init(scaleX: 0.001, y: 0.001)
        UIView.animate(withDuration: 0.3/1.5, animations: { () -> Void in
            self.hudView.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1)
            
        }) { (completion) -> Void in
            
            UIView.animate(withDuration: 0.3/1.5, animations: { () -> Void in
                self.hudView.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
            }) { (completion) -> Void in
                
                UIView.animate(withDuration: 0.3/1.5, animations: { () -> Void in
                    self.hudView.transform = CGAffineTransform.identity
                }) { (completion) -> Void in
                    
                }
            }
        }
    }
    
    func bounceIn(){
        
        hudView.alpha = 0.0;
        hudView.isHidden = false;
        hudView.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: UIViewAnimationOptions(rawValue: 0), animations: {
            self.hudView.alpha = 1.0;
            self.hudView.transform = CGAffineTransform.identity;
            }, completion: nil)
        
    }
    
    func bounceFromTop() -> Void {
        
        hudView.isHidden = false
        hudView.transform = CGAffineTransform.identity
        
        var startFrame = hudView.frame;
        let finalFrame = startFrame
        startFrame.origin.y = -finalFrame.height
        hudView.frame = startFrame;
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: UIViewAnimationOptions(rawValue: 0), animations: {
            self.hudView.alpha = 1.0;
            self.hudView.transform = CGAffineTransform.identity;
            self.hudView.frame = finalFrame
            }, completion: nil)
    }
    
}

//MARK:-------------------------HUD Dismiss ANIMATION METHOD--------------------------
extension ACProgressView {
    
    func fadeOut() -> Void {
        UIView.animate(withDuration: 0.30, delay: 0, options: .curveLinear, animations: {
            self.hudView.alpha = 0.0;
        }) { (completed) in
            self.view.removeFromSuperview()
            
        }
    }
    
    func growOut() -> Void {
        UIView.animate(withDuration: 1.1, delay: 0, options: UIViewAnimationOptions(rawValue: 458752), animations: {
            self.hudView.alpha = 0.0;
            self.hudView.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            
        }) { (completed) in
            self.view.removeFromSuperview()
        }
    }
    
    func shrinkOut() -> Void {
        UIView.animate(withDuration: 1.1, delay: 0, options: UIViewAnimationOptions(rawValue: 458752), animations: {
            self.hudView.alpha = 0.0;
            self.hudView.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            
        }) { (completed) in
            self.view.removeFromSuperview()
            
        }
    }
    
    func slideToTop() -> Void {
        UIView.animate(withDuration: 0.15, delay: 0, options: UIViewAnimationOptions(rawValue: 458752), animations: {
            var startFrame = self.hudView.frame;
            startFrame.origin.y = -self.hudView.frame.height
            self.hudView.frame = startFrame;
            
        }) { (completed) in
            self.view.removeFromSuperview()
        }
    }
    
    func slideToBottom() -> Void {
        UIView.animate(withDuration: 0.15, delay: 0, options: UIViewAnimationOptions(rawValue: 458752), animations: {
            var startFrame = self.hudView.frame;
            startFrame.origin.y = UIScreen.main.bounds.height
            self.hudView.frame = startFrame;
            
        }) { (completed) in
            self.view.removeFromSuperview()
        }
    }
    
    func bounceOut() -> Void {
        
        UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseOut, animations: {
            self.hudView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        }) { (finished) in
            UIView.animate(withDuration: 0.30, delay: 0, options: .curveEaseIn, animations: {
                self.hudView.alpha = 0.0
                self.hudView.transform = CGAffineTransform.init(scaleX: 0.3, y: 0.3)
            }) { (finished) in
                self.view.removeFromSuperview()
                
            }
        }
    }
    
    func bounceToTop() {
        
        UIView.animate(withDuration: 0.30, delay: 0, options: .curveEaseOut, animations: {
            
            var frame = self.hudView.frame
            frame.origin.y += 45
            self.hudView.frame = frame
            
        }) { (completed) in
            
            UIView.animate(withDuration: 0.40, delay: 0, options: .curveEaseIn, animations: {
                
                var frame = self.hudView.frame
                frame.origin.y = -(UIScreen.main.bounds.height)
                self.hudView.frame = frame
                
            }) { (completed) in
                
                self.view.removeFromSuperview()
                
            }
            
        }
        
    }
    
    func bounceToBottom() {
        
        UIView.animate(withDuration: 0.30, delay: 0, options: .curveEaseOut, animations: {
            
            var frame = self.hudView.frame
            frame.origin.y -= 45
            self.hudView.frame = frame
            
        }) { (completed) in
            
            UIView.animate(withDuration: 0.40, delay: 0, options: .curveEaseIn, animations: {
                
                var frame = self.hudView.frame
                frame.origin.y = UIScreen.main.bounds.height
                self.hudView.frame = frame
                
            }) { (completed) in
                
                self.view.removeFromSuperview()
                
            }
            
        }
        
    }
    
    
}
