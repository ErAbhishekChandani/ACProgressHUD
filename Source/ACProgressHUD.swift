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

open class ACProgressHUD {
    
    /// Singleton object of ACProgressHUD
    static public let shared = ACProgressHUD()
    
    /// ACProgressView reference
    internal var acProgressView : ACProgressView!
    
    /// Set the Text in Progress label.
    open var progressText: String
    
    /// Set the Text Color in Progress label.
    open var progressTextColor: UIColor
    
    /// Set the Text Font in Progress label.
    open var progressTextFont: UIFont
    
    /// Set the Hud **Shadow Color**.
    open var shadowColor: UIColor
    
    /// Set the **Shadow Radius** of Hud View.
    open var shadowRadius: CGFloat
    
    /// Set the **Corner Radius** of Hud View.
    open var cornerRadius: CGFloat
    
    /// Set the **Indicator Color** of Hud View.
    open var indicatorColor: UIColor
    
    /// Set the **Background Color** of Hud View.
    open var hudBackgroundColor: UIColor
    
    /// Show Dim **Background** ?
    open var enableBackground: Bool
    
    /// Set Dim **Background Color**.
    open var backgroundColor: UIColor
    
    /// Set Dim Background Color **Opacity**.
    open var backgroundColorAlpha: CGFloat
    
    /// Show **Blur Background** ?
    open var enableBlurBackground: Bool
    
    /// Set **Blur Background Color**.
    open var blurBackgroundColor: UIColor
    
    /// Animation when showing HUD.
    open var showHudAnimation: ACHudShowAnimation
    
    /// Change Animation when Dismiss HUD.
    open var dismissHudAnimation: ACHudDismissAnimation
    
    private(set) public var isBeingShown: Bool
    
    
    private init() {
        self.acProgressView = nil
        self.progressText = "Please wait..."
        self.progressTextColor = .black
        self.progressTextFont = .systemFont(ofSize: UIFont.labelFontSize)
        self.shadowColor = .black
        self.shadowRadius = 10.0
        self.cornerRadius = 5
        self.indicatorColor = .black
        self.hudBackgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1)
        self.enableBackground = true
        self.backgroundColor = .black
        self.backgroundColorAlpha = 0.5
        self.enableBlurBackground = false
        self.blurBackgroundColor = .clear
        self.showHudAnimation = .growIn
        self.dismissHudAnimation = .growOut
        self.isBeingShown = false
    }
    
    /**
     
     - Configure HUD style through out the app.
     
     - Parameter text: Set the Text in Progress label.
     - Parameter progressTextColor: Set the Text Color in Progress label.
     - Parameter progressTextFont: Set the Text Font in Progress label.
     - Parameter shadowColor: Set the Hud **Shadow Color**.
     - Parameter shadowRadius: Set the **Shadow Radius** of Hud View.
     - Parameter cornerRadius: Set the **Corner Radius** of Hud View.
     - Parameter indicatorColor: Set the **Indicator Color** of Hud View.
     - Parameter hudBackgroundColor: Change the **Background Color** of Hud View.
     - Parameter enableBackground: Show Dim **Background**?
     - Parameter backgroundColor: Set Dim **Background Color**.
     - Parameter backgroundColorAlpha: Set Dim Background Color **Opacity**.
     - Parameter enableBlurBackground: Show **Blur Background**?
     - Parameter showHudAnimation: Animation when showing HUD.
     - Parameter dismissHudAnimation: Change Animation when Dismiss HUD.
     
     */
    open func configureStyle(withProgressText text: String,
                             progressTextColor tColor: UIColor,
                             progressTextFont tFont: UIFont,
                             shadowColor sColor: UIColor,
                             shadowRadius sRadius: CGFloat,
                             cornerRadius cRadius: CGFloat,
                             indicatorColor iColor: UIColor,
                             hudBackgroundColor hColor: UIColor,
                             enableBackground enable: Bool,
                             backgroundColor bColor: UIColor,
                             backgroundColorAlpha bAlpha: CGFloat,
                             enableBlurBackground blEnable: Bool,
                             showHudAnimation sAnimation: ACHudShowAnimation,
                             dismissHudAnimation dAnimation: ACHudDismissAnimation) {
        
        self.progressText = text
        self.progressTextColor = tColor
        self.progressTextFont = tFont
        self.shadowColor = sColor
        self.shadowRadius = sRadius
        self.cornerRadius = cRadius
        self.indicatorColor = iColor
        self.hudBackgroundColor = hColor
        self.enableBackground = enable
        self.backgroundColor = bColor
        self.backgroundColorAlpha = bAlpha < 1 ? bAlpha : 0.5
        self.enableBlurBackground = blEnable
        self.showHudAnimation = sAnimation
        self.dismissHudAnimation = dAnimation
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
