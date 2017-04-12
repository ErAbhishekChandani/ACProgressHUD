//
//  AnimationChoiceViewController.swift
//  ACProgressHUD
//
//  Created by Er Abhishek Chandani on 03/04/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit

class AnimationCell: UITableViewCell {
    
    @IBOutlet weak var labelSelectionIndicator: UILabel!
    @IBOutlet weak var labelAnimationName: UILabel!
}

let showAnimations  =   ["Grow In","Shrink In","Bounce In","Zoom In Out","Slide From Top","Bounce From Top","None"]
let dismissAnimations  =   ["Grow Out","Shrink Out","Fade Out","Bounce Out","Slide To Top","Slide To Bottom","Bounce To Top","Bounce To Bottom","None"]

class AnimationChoiceViewController: UIViewController {

    var selectedAnimation : String = "Grow In"
    
    enum AnimationType {
        case show
        case dismiss
    }

    var animationType : AnimationType = .show
    
    //MARK:- UIView Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if animationType == .show {
            selectedAnimation = showAnimations[showHUDAnimation.rawValue]
        }else{
            selectedAnimation = dismissAnimations[dismissHUDAnimation.rawValue]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK:- UIButton Action Methods
    @IBAction func actionOnDone(_ sender: AnyObject) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK:- UITableView Datasource & Delegate
extension AnimationChoiceViewController : UITableViewDataSource , UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if animationType == .show {
            return showAnimations.count
        }else{
            return dismissAnimations.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimationCell") as! AnimationCell
        if animationType == .show {
            cell.labelAnimationName.text = showAnimations[indexPath.row]
        }else{
            cell.labelAnimationName.text = dismissAnimations[indexPath.row]
        }
        
        if cell.labelAnimationName.text == selectedAnimation {
            cell.labelSelectionIndicator.isHidden = false
        }else  {cell.labelSelectionIndicator.isHidden = true }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if animationType == .show {
            selectedAnimation = showAnimations[indexPath.row]
            showHUDAnimation = ACHudShowAnimation(rawValue: indexPath.row) ?? .growIn
        }else{
            selectedAnimation = dismissAnimations[indexPath.row]
            dismissHUDAnimation = ACHudDismissAnimation(rawValue: indexPath.row) ?? .growOut

        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
