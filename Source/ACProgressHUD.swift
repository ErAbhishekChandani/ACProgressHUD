//
//  ACProgressHUD.swift
//  ACProgressHUD
//
//  Created by Er. Abhishek Chandani on 18/03/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit

open class ACProgressHUD : NSObject {

    var acProgressView : ACProgressView!

    /// Set the Text in Progress label.
    open var progressText : String = "Please wait...";

    /// Set the Hud Shadow Color.
    open var shadowColor : UIColor = UIColor.black;

    /// Set the Shadow radius of Hud View.
    open var shadowRadius : CGFloat = 10.0;
    
    /// Set the Corner radius of Hud View.
    open var cornerRadius : CGFloat = 5.0;

    /// Set the Indicator Color of Hud View.
    open var indicatorColor : UIColor = UIColor.black;

    /// Set the Indicator Color of Hud View.
    open var hudBackgroundColor : UIColor = UIColor.init(colorLiteralRed: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0);

    /// Show Dim Background ?
    open var enableBackground : Bool = true;

    /// Set Dim Background Color.
    open var backgroundColor : UIColor = UIColor.black;

    /// Set Dim Background Color Transparancy.
    open var backgroundColorAlpha : CGFloat = 0.5;

    /// Show Blur Background ?
    open var enableBlurBackground : Bool = false;
    
    /// Set Blur Background Color.
    open var blurBackgroundColor : UIColor = UIColor.clear;
    
    /// Animation when showing HUD
    open var showHudAnimation : ACHudShowAnimation = .growIn
    
    /// Change Animation when Dismiss HUD
    open var dismissHudAnimation : ACHudDismissAnimation = .growOut
    
    static open let shared : ACProgressHUD = ACProgressHUD();
    
    private(set) public var isBeingShown : Bool  = false
    
    //MARK:- INITIALIZATION
    open func configureACProgressHudStyle(withProgressText text:String,hudBackgroundColor hcolor:UIColor,shadowColor scolor:UIColor,shadowRadius sradius:CGFloat,cornerRadius cradius:CGFloat,indicatorColor icolor:UIColor,enableBackground enable:Bool,backgroundColor bcolor:UIColor,backgroundColorAlpha balpha:CGFloat,enableBlurBackground blenable:Bool,showHudAnimation sanimation:ACHudShowAnimation,dismissHudAnimation danimation:ACHudDismissAnimation) {
    
        progressText = text
        hudBackgroundColor = hcolor
        shadowColor = scolor
        shadowRadius = sradius
        cornerRadius = cradius
        indicatorColor = icolor
        enableBackground = enable
        backgroundColor = bcolor
        backgroundColorAlpha = balpha < 1 ? balpha : 0.5
        enableBlurBackground = blenable
        showHudAnimation = sanimation
        dismissHudAnimation = danimation
    }
    
    //MARK:- Show HUD
    open func showHUD() -> Void {
        if isBeingShown {
            return
        }
        self.isBeingShown = true
        acProgressView = ACProgressView()
        acProgressView.show();
    }
    
    //MARK:- Hide HUD
    open func hideHUD() -> Void {
        if !self.isBeingShown {
            return
        }
        self.isBeingShown = false
        acProgressView.hide()
    }
    
    
}
