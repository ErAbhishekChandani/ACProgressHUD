//
//  ViewController.swift
//  ACProgressHUD
//
//  Created by Er Abhishek Chandani on 18/03/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit

var showHUDAnimation : ACHudShowAnimation = .growIn
var dismissHUDAnimation : ACHudDismissAnimation = .growOut

class ViewController: UIViewController {

    @IBOutlet weak var buttonDismiss: UIButton!
    @IBOutlet weak var buttonShow: UIButton!
    
    //MARK:- UIView Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        buttonShow.setTitle(showAnimations[showHUDAnimation.rawValue], for: .normal)
        buttonDismiss.setTitle(dismissAnimations[dismissHUDAnimation.rawValue], for: .normal)
        
        ACProgressHUD.shared.showHudAnimation = showHUDAnimation
        ACProgressHUD.shared.dismissHudAnimation = dismissHUDAnimation
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK:- Other Methods
    @objc func hideHUD(){
        ACProgressHUD.shared.hideHUD()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let aVC = segue.destination as? AnimationChoiceViewController
        aVC?.animationType = segue.identifier == "ShowAnimation" ? .show : .dismiss
    }
    
}

//MARK:- UIButton Action Method
extension ViewController {

    @IBAction func backgroundAlphaValueChanged(_ sender: AnyObject) {
        ACProgressHUD.shared.backgroundColorAlpha = CGFloat((sender as! UISlider).value)
    }
    @IBAction func enableBackground(_ sender: AnyObject) {
        ACProgressHUD.shared.enableBackground = (sender as! UISwitch).isOn
    }
    @IBAction func enableBlurBackground(_ sender: AnyObject) {
        ACProgressHUD.shared.enableBlurBackground = (sender as! UISwitch).isOn
    }
    @IBAction func actionOnShow(_ sender: AnyObject) {
        ACProgressHUD.shared.showHUD(withStatus: "Loading...")
        self.perform(#selector(self.hideHUD), with: nil, afterDelay: 5.0)
    }
    @IBAction func actionShowWithDifferentText(_ sender: AnyObject) {
        let progressView = ACProgressHUD.shared
        progressView.progressText = ""
        progressView.showHUD()
        self.perform(#selector(self.hideHUD), with: nil, afterDelay: 5.0)
    }

}

