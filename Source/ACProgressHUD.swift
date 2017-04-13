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
//  ACProgressHUD.swift
//  ACProgressHUD
//
//  Created by Er. Abhishek Chandani on 18/03/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit

open class ACProgressHUD : NSObject {

    /// ACProgressView reference
    var acProgressView : ACProgressView!

    /// Set the Text in Progress label.
    open var progressText : String = "Please wait..."
    
    /// Set the Text Color in Progress label.
    open var progressTextColor : UIColor = UIColor.black

    /// Set the Hud **Shadow Color**.
    open var shadowColor : UIColor = UIColor.black

    /// Set the **Shadow Radius** of Hud View.
    open var shadowRadius : CGFloat = 10.0
    
    /// Set the **Corner Radius** of Hud View.
    open var cornerRadius : CGFloat = 5

    /// Set the **Indicator Color** of Hud View.
    open var indicatorColor : UIColor = UIColor.black
    
    /// Set the **Background Color** of Hud View.
    open var hudBackgroundColor : UIColor = UIColor.init(colorLiteralRed: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)

    /// Show Dim **Background** ?
    open var enableBackground : Bool = true

    /// Set Dim **Background Color**.
    open var backgroundColor : UIColor = UIColor.black

    /// Set Dim Background Color **Opacity**.
    open var backgroundColorAlpha : CGFloat = 0.5

    /// Show **Blur Background** ?
    open var enableBlurBackground : Bool = false
    
    /// Set **Blur Background Color**.
    open var blurBackgroundColor : UIColor = UIColor.clear
    
    /// Animation when showing HUD.
    open var showHudAnimation : ACHudShowAnimation = .growIn
    
    /// Change Animation when Dismiss HUD.
    open var dismissHudAnimation : ACHudDismissAnimation = .growOut
    
    static open let shared : ACProgressHUD = ACProgressHUD()
    
    private(set) public var isBeingShown : Bool  = false
    
    /**
     
     - Configure HUD style through out the app.
     
     - Parameter text: Set the Text in Progress label.
     - Parameter progressTextColor: Set the Text Color in Progress label.
     - Parameter hudBackgroundColor: Change the **Background Color** of Hud View.
     - Parameter shadowColor: Set the Hud **Shadow Color**.
     - Parameter shadowRadius: Set the **Shadow Radius** of Hud View.
     - Parameter cornerRadius: Set the **Corner Radius** of Hud View.
     - Parameter indicatorColor: Set the **Indicator Color** of Hud View.
     - Parameter enableBackground: Show Dim **Background**?
     - Parameter backgroundColor: Set Dim **Background Color**.
     - Parameter backgroundColorAlpha: Set Dim Background Color **Opacity**.
     - Parameter enableBlurBackground: Show **Blur Background**?
     - Parameter showHudAnimation: Animation when showing HUD.
     - Parameter dismissHudAnimation: Change Animation when Dismiss HUD.
     
     */
    open func configureProgressHudStyle(withProgressText text:String,progressTextColor tcolor:UIColor,hudBackgroundColor hcolor:UIColor,shadowColor scolor:UIColor,shadowRadius sradius:CGFloat,cornerRadius cradius:CGFloat,indicatorColor icolor:UIColor,enableBackground enable:Bool,backgroundColor bcolor:UIColor,backgroundColorAlpha balpha:CGFloat,enableBlurBackground blenable:Bool,showHudAnimation sanimation:ACHudShowAnimation,dismissHudAnimation danimation:ACHudDismissAnimation) {
    
        progressText = text
        progressTextColor = tcolor
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
    /// Display Progres HUD.
    open func showHUD() -> Void {
        if isBeingShown {
            return
        }
        self.isBeingShown = true
        acProgressView = ACProgressView()
        acProgressView.show()
    }
    
    /**
     - Display Progres HUD.
     - Parameter status: Set the Text in Progress label.
    */
    open func showHUD(withStatus status:String) {
        if isBeingShown {
            return
        }
        self.isBeingShown = true
        self.progressText = status
        acProgressView = ACProgressView()
        acProgressView.show()
    }

    //MARK:- Hide HUD
    /// Dismiss Progress HUD.
    open func hideHUD() -> Void {
        if !self.isBeingShown {
            return
        }
        self.isBeingShown = false
        acProgressView.hide()
    }
    
    
}
