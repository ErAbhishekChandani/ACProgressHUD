//
//  ACProgressView.swift
//  ACProgressHUD
//
//  Created by Er. Abhishek Chandani on 02/04/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit

class ACProgressView: UIView {

    var view:UIView!;

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
                    break;
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
        
        customizeAppeareance()
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle.main
        let nib = UINib(nibName: "ACProgressView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    // Customization....
    func customizeAppeareance(){
    
        self.hudView.backgroundColor = ACProgressHUD.shared.hudBackgroundColor
        self.hudView.layer.shadowColor = ACProgressHUD.shared.shadowColor.cgColor
        self.hudView.layer.shadowRadius = ACProgressHUD.shared.shadowRadius
        self.hudView.layer.shadowOpacity = 0.3
        self.hudView.layer.shadowOffset =  CGSize(width: 1.0, height: 1)
        self.hudView.layer.masksToBounds = true
        self.hudView.layer.cornerRadius = ACProgressHUD.shared.cornerRadius

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
