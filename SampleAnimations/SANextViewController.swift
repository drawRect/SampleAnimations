//
//  NextViewController.swift
//  SampleAnimations
//
//  Created by Boominadha Prakash on 16/03/18.
//  Copyright © 2018 Boominadha Prakash. All rights reserved.
//

import UIKit

class SANextViewController: UIViewController {

    //MARK:- iVars
    var animationProperty: SAAnimationProperty?
    @IBOutlet weak var detailLbl: UILabel!{didSet{
        detailLbl.font = UIFont.systemFont(ofSize: 14)
        }}
    
    //MARK:- Overridden functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1.0)
        self.title = "FirstVC"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(didTapBackBtn(_:)))
        if let property = animationProperty {
            detailLbl.text = "Type: \(property.type.desc.capitalized)\n\nSubType: \(property.subtype?.desc ?? "")"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Private functions
    @objc private func didTapBackBtn(_ sender: Any) {
        if var property = animationProperty {
            if property.subtype == .right {
                property.subtype = .left
            }else if property.subtype == .left {
                property.subtype = .right
            }else if property.subtype == .top {
                property.subtype = .bottom
            }else if property.subtype == .bottom {
                property.subtype = .top
                
            }
            animationProperty = property
        }
        doAnimationWithProperties(with: animationProperty!)
    }
    private func doAnimationWithProperties(with property: SAAnimationProperty) {
        let transition = CATransition()
        transition.duration = property.duration
        transition.type = property.type.desc
        transition.subtype = property.subtype?.desc
        transition.timingFunction = CAMediaTimingFunction(name: property.timingFunctionName)
        view.window?.layer.add(transition, forKey: kCATransition)
        self.navigationController?.popViewController(animated: true)
    }
}
