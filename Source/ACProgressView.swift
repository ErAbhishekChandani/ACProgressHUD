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

final class ACProgressView: UIView {
    
    //MARK: - Outlets
    @IBOutlet internal weak var blurView: UIVisualEffectView!
    @IBOutlet internal weak var hudView: UIView!
    @IBOutlet internal weak var textLabel: UILabel!
    @IBOutlet internal weak var activityIndicator: UIActivityIndicatorView!
    
    
    //MARK: - Variables
    var view: UIView!
    fileprivate let progressHud = ACProgressHUD.shared
    fileprivate class var reuseIdentifier: String {
        return String(describing: self)
    }
    
    
    //MARK: - Initialization
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
                if (window.windowLevel == UIWindow.Level.normal) {
                    window.addSubview(self.view)
                    self.view.frame = window.bounds
                    break
                }
            }
            
            //BACKGROUND ANIMATION
            if self.progressHud.enableBackground {
                
                self.view.backgroundColor = self.view.backgroundColor?.withAlphaComponent(0)
                UIView.animate(withDuration: 0.30, delay: 0, options: .curveLinear, animations: {
                    self.view.backgroundColor = self.view.backgroundColor?.withAlphaComponent(self.progressHud.backgroundColorAlpha)
                }, completion: nil)
            }
            // HUD ANIMATION
            switch self.progressHud.showHudAnimation {
                
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
            if self.progressHud.enableBackground {
                
                self.view.backgroundColor = self.view.backgroundColor?.withAlphaComponent(self.progressHud.backgroundColorAlpha)
                UIView.animate(withDuration: 0.30, delay: 0, options: .curveLinear, animations: {
                    self.view.backgroundColor = self.view.backgroundColor?.withAlphaComponent(0)
                }, completion: nil)
            }
            
            switch self.progressHud.dismissHudAnimation {
                
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
        self.addSubview(view)
        
        view.frame = bounds
        appeareance()
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: ACProgressView.self)
        let nib = UINib(nibName: ACProgressView.reuseIdentifier, bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            fatalError("ERROR loading ACProgressView.\n\(#file)\n\(#line)")
        }
        
        return view
    }
    
    /// Customization HUD appeareance
    func appeareance(){
        
        self.textLabel.text = progressHud.progressText
        self.textLabel.textColor = progressHud.progressTextColor
        self.textLabel.font = progressHud.progressTextFont
        self.activityIndicator.color = progressHud.indicatorColor
        
        self.hudView.backgroundColor = progressHud.hudBackgroundColor
        self.hudView.layer.cornerRadius = progressHud.cornerRadius
        self.hudView.layer.shadowColor = progressHud.shadowColor.cgColor
        self.hudView.layer.shadowRadius = progressHud.shadowRadius
        self.hudView.layer.shadowOpacity = 0.7
        self.hudView.layer.shadowOffset =  CGSize(width: 1, height: 1)
        
        self.view.backgroundColor =  progressHud.enableBackground == true ? progressHud.backgroundColor.withAlphaComponent(progressHud.backgroundColorAlpha) : .clear
        self.blurView.isHidden = progressHud.enableBlurBackground == true ? false : true
        
        if  !self.blurView.isHidden {
            self.view.backgroundColor = progressHud.blurBackgroundColor
        }
    }
}

//MARK: - Orientation
//Window will not change Orientation when ACProgressHUD is being Shown.
extension UINavigationController {
    
    open override var shouldAutorotate: Bool {
        
        if ACProgressHUD.shared.isBeingShown {
            return false
        } else {
            return true
        }
    }
}
