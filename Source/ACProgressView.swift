/*
 MIT License
 
 Copyright (c) 2017 Er Abhishek Chandnai
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

//
//  ACProgressView.swift
//  ACProgressHUD
//
//  Created by Er. Abhishek Chandani on 02/04/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit

class ACProgressView: UIView {

    var view:UIView!

    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var hudView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK:- Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }
    
    //MARK:- SHOW HUD
    func show(){
    
        DispatchQueue.main.async {
            let allWindows = UIApplication.shared.windows.reversed()
            for window in allWindows {
                if (window.windowLevel == UIWindowLevelNormal) {
                    window.addSubview(self.view)
                    self.view.frame = window.bounds
                    break
                }
            }
            
            //BACKGROUND ANIMATION
            if ACProgressHUD.shared.enableBackground {
                
                self.view.backgroundColor = self.view.backgroundColor?.withAlphaComponent(0)
                UIView.animate(withDuration: 0.30, delay: 0, options: .curveLinear, animations: {
                    self.view.backgroundColor = self.view.backgroundColor?.withAlphaComponent(ACProgressHUD.shared.backgroundColorAlpha)
                    }, completion: nil)
            }
            // HUD ANIMATION
            switch ACProgressHUD.shared.showHudAnimation {
                
            case .growIn :
                self.growIn()
                break
            case .shrinkIn :
                self.shrinkIn()
                break
            case .bounceIn :
                self.bounceIn()
                break
            case .zoomInOut :
                self.zoomInZoomOut()
                break
            case .slideFromTop :
                self.slideFromTop()
                break
            case .bounceFromTop :
                self.bounceFromTop()
                break
            default :
                break

            }
        }
    }
    
    //MARK:- HIDE HUD
    func hide() {
        DispatchQueue.main.async {
            
            //BACKGROUND ANIMATION
            if ACProgressHUD.shared.enableBackground {
                
                self.view.backgroundColor = self.view.backgroundColor?.withAlphaComponent(ACProgressHUD.shared.backgroundColorAlpha)
                UIView.animate(withDuration: 0.30, delay: 0, options: .curveLinear, animations: {
                    self.view.backgroundColor = self.view.backgroundColor?.withAlphaComponent(0)
                    }, completion: nil)
            }

            switch ACProgressHUD.shared.dismissHudAnimation {
                
            case .growOut :
                self.growOut()
                break
            case .shrinkOut :
                self.shrinkOut()
                break
            case .fadeOut :
                self.fadeOut()
                break
            case .bounceOut :
                self.bounceOut()
                break
            case .slideToTop :
                self.slideToTop()
                break
            case .slideToBottom :
                self.slideToBottom()
                break
            case .bounceToTop :
                self.bounceToTop()
                break
            case .bounceToBottom :
                self.bounceToBottom()
                break

            default :
                self.view.removeFromSuperview()
                break
            }

        }
    }

}

//MARK:- Private Methods
fileprivate extension ACProgressView {

    // Loading Xib
    func xibSetup() {
        
        view = loadViewFromNib()
        view.frame = bounds
        self.addSubview(view)
        
        appeareance()
    }
    
    func loadViewFromNib() -> UIView {
       
        let bundle = Bundle(for: ACProgressView.self)
        let nib = UINib(nibName: "ACProgressView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    /// Customization HUD appeareance
    func appeareance(){
    
        self.textLabel.text = ACProgressHUD.shared.progressText
        self.textLabel.textColor = ACProgressHUD.shared.progressTextColor
        self.activityIndicator.color = ACProgressHUD.shared.indicatorColor
        
        self.hudView.backgroundColor = ACProgressHUD.shared.hudBackgroundColor
        self.hudView.layer.cornerRadius = ACProgressHUD.shared.cornerRadius
        self.hudView.layer.shadowColor = ACProgressHUD.shared.shadowColor.cgColor
        self.hudView.layer.shadowRadius = ACProgressHUD.shared.shadowRadius
        self.hudView.layer.shadowOpacity = 0.7
        self.hudView.layer.shadowOffset =  CGSize(width:1,height:1)

        self.view.backgroundColor =  ACProgressHUD.shared.enableBackground == true ? ACProgressHUD.shared.backgroundColor.withAlphaComponent(ACProgressHUD.shared.backgroundColorAlpha) : UIColor.clear
        self.blurView.isHidden = ACProgressHUD.shared.enableBlurBackground == true ? false : true

        if  !self.blurView.isHidden {
            self.view.backgroundColor = ACProgressHUD.shared.blurBackgroundColor
        }
    }
    
}

//MARK:- Orientation
//Window will not change Orientation when ACProgressHUD is being Shown.
extension UINavigationController {
    
    open override var shouldAutorotate: Bool {
        
        if ACProgressHUD.shared.isBeingShown {
            return false
        }else{
            return true
        }
    }
}
