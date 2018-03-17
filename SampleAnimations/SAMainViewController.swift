//
//  ViewController.swift
//  SampleAnimations
//
//  Created by Boominadha Prakash on 16/03/18.
//  Copyright © 2018 Boominadha Prakash. All rights reserved.
//

import UIKit

class SAMainViewController: UIViewController {
    
    //MARK:- iVars
    fileprivate let reuseIdentifier = "Cell"
    @IBOutlet weak var tableView: UITableView!{didSet{
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderHeight = 44.0
        }}
    var animationSource: [SAAnimationType] = [
        SAAnimationType.init(name: .push, properties:[
            SAAnimationProperty.init(animationName: .fromRight, type: .push, subtype: .right),
            SAAnimationProperty.init(animationName: .fromLeft, type: .push, subtype: .left),
            SAAnimationProperty.init(animationName: .fromBottom, type: .push, subtype: .bottom),
            SAAnimationProperty.init(animationName: .fromTop, type: .push, subtype: .top)
            ]),
        SAAnimationType.init(name: .fade, properties: [
            SAAnimationProperty.init(animationName: .fade, type: .fade, subtype: .notExist)
            ]),
        SAAnimationType.init(name: .movein, properties: [
            SAAnimationProperty.init(animationName: .fromRight, type: .movein, subtype: .right),
            SAAnimationProperty.init(animationName: .fromLeft, type: .movein, subtype: .left),
            SAAnimationProperty.init(animationName: .fromBottom, type: .movein, subtype: .bottom),
            SAAnimationProperty.init(animationName: .fromTop, type: .movein, subtype: .top)
            ]),
        SAAnimationType.init(name: .reveal, properties: [
            SAAnimationProperty.init(animationName: .fromRight, type: .reveal, subtype: .right),
            SAAnimationProperty.init(animationName: .fromLeft, type: .reveal, subtype: .left),
            SAAnimationProperty.init(animationName: .fromBottom, type: .reveal, subtype: .bottom),
            SAAnimationProperty.init(animationName: .fromTop, type: .reveal, subtype: .top)
            ])
    ]
    
    //MARK:- Overridden functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "HomeVC"
        view.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1.0)
        self.navigationController?.navigationBar.isTranslucent = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        view.layer.removeAllAnimations()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK:- Fileprivate functions
    fileprivate func doAnimationWithProperties(with type: SAAnimationType, on row: Int) {
        let transition = CATransition()
        let property = type.properties[row]
        transition.duration = property.duration
        transition.type = property.type.desc
        transition.subtype = property.subtype?.desc
        transition.timingFunction = CAMediaTimingFunction(name: property.timingFunctionName)
        view.window?.layer.add(transition, forKey: kCATransition)
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SANextViewController") as? SANextViewController else {return}
        vc.animationProperty = property
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SAMainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return animationSource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animationSource[section].properties.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = animationSource[indexPath.section].properties[indexPath.row].animationName.desc
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44.0))
        view.backgroundColor = .white
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: view.frame.width-20, height: view.frame.height))
        label.text = animationSource[section].name.desc
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.brown
        view.addSubview(label)
        return view
    }
}

extension SAMainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        doAnimationWithProperties(with: animationSource[indexPath.section], on: indexPath.row)
    }
}
