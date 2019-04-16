//
//  AppDelegate.swift
//  Get_Woke!
//
//  Created by Tomoki Takasawa on 4/15/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit
import UIView_Shake

class QuestionsViewController: UIViewController, BlueToothHandler {
    
    let panelColor = UIColor.darkGray
    let backgrounColor = UIColor(red: 14.0/255.0, green: 17.0/255.0, blue: 17.0/255.0, alpha: 1)
    let buttonColor = UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 1/255.0, alpha: 1)
    let labelColor = UIColor.white
    
    
    let questions = [
        "4 + 3",
        "8 / 2",
        "9 - 2"
    ]
    
    let answers = [
        "7",
        "4",
        "7"
    ]
    
    var choices = [
        "2",
        "7",
        "4",
        "5"
    ]
    
    let state: Int
    let currentAns: Int
    
    let panel1 = UIButton()
    let panel2 = UIButton()
    let panel3 = UIButton()
    let panel4 = UIButton()
    
    let titleLabel = UILabel()
    let nextButton = UIButton()
    
    let pageControl: UIPageControl = {
        let p = UIPageControl()
        p.pageIndicatorTintColor =  UIColor.darkGray
        p.translatesAutoresizingMaskIntoConstraints = false
//        p.tintColor = UIColor.red
        p.numberOfPages = 3
        
        return p
    }()
    
    init(state: Int) {
        self.state = state
        self.currentAns = 0
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = backgrounColor
        self.configure()
        self.constrain()
    }
    
    func configure(){
        
        pageControl.currentPageIndicatorTintColor = buttonColor
        
        panel1.backgroundColor = backgrounColor
        panel1.layer.borderColor = UIColor.lightGray.cgColor
        panel1.layer.borderWidth = 2
        panel1.translatesAutoresizingMaskIntoConstraints = false
        panel1.setTitle(choices[0], for: .normal)
        panel1.setTitleColor(labelColor, for: .normal)
        panel1.layer.cornerRadius = 8
        panel1.addTarget(self, action: #selector(self.press1), for: .touchUpInside)
        
        panel2.backgroundColor = backgrounColor
        panel2.layer.borderColor = UIColor.lightGray.cgColor
        panel2.layer.borderWidth = 2
        panel2.translatesAutoresizingMaskIntoConstraints = false
        panel2.setTitle(choices[1], for: .normal)
        panel2.setTitleColor(labelColor, for: .normal)
        panel2.layer.cornerRadius = 8
        panel2.addTarget(self, action: #selector(self.press2), for: .touchUpInside)
        
        panel3.backgroundColor = backgrounColor
        panel3.layer.borderColor = UIColor.lightGray.cgColor
        panel3.layer.borderWidth = 2
        panel3.translatesAutoresizingMaskIntoConstraints = false
        panel3.setTitle(choices[2], for: .normal)
        panel3.setTitleColor(labelColor, for: .normal)
        panel3.layer.cornerRadius = 8
        panel3.addTarget(self, action: #selector(self.press3), for: .touchUpInside)
        
        panel4.backgroundColor = backgrounColor
        panel4.layer.borderColor = UIColor.lightGray.cgColor
        panel4.layer.borderWidth = 2
        panel4.translatesAutoresizingMaskIntoConstraints = false
        panel4.setTitle(choices[3], for: .normal)
        panel4.setTitleColor(labelColor, for: .normal)
        panel4.layer.cornerRadius = 8
        panel4.addTarget(self, action: #selector(self.press4), for: .touchUpInside)
        
        panel1.titleLabel?.font = UIFont.systemFont(ofSize: 28.0)
        panel2.titleLabel?.font = UIFont.systemFont(ofSize: 28.0)
        panel3.titleLabel?.font = UIFont.systemFont(ofSize: 28.0)
        panel4.titleLabel?.font = UIFont.systemFont(ofSize: 28.0)
        
        titleLabel.text = questions[self.state]
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = labelColor
        titleLabel.font = UIFont.systemFont(ofSize: 45.0)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.backgroundColor = buttonColor
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.titleLabel?.textColor = labelColor
        nextButton.addTarget(self, action: #selector(self.hitNext), for: .touchUpInside)
        nextButton.layer.cornerRadius = 30
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        pageControl.currentPage = self.state
        
        self.view.addSubview(titleLabel)
        
        self.view.addSubview(panel1)
        self.view.addSubview(panel2)
        self.view.addSubview(panel3)
        self.view.addSubview(panel4)
        
        self.view.addSubview(pageControl)
        self.view.addSubview(nextButton)
    }
    
    func constrain(){
        titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        panel1.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 40).isActive = true
        panel1.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: -20).isActive = true
        panel1.heightAnchor.constraint(equalTo: panel1.widthAnchor).isActive = true
        panel1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60).isActive = true
        
        
        
        panel2.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 20).isActive = true
        panel2.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -40).isActive = true
        panel2.heightAnchor.constraint(equalTo: panel2.widthAnchor).isActive = true
        panel2.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60).isActive = true
        
        
        panel3.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 40).isActive = true
        panel3.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: -20).isActive = true
        panel3.heightAnchor.constraint(equalTo: panel3.widthAnchor).isActive = true
        panel3.topAnchor.constraint(equalTo: panel1.bottomAnchor, constant: 40).isActive = true
        
        
        panel4.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 20).isActive = true
        panel4.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -40).isActive = true
        panel4.heightAnchor.constraint(equalTo: panel4.widthAnchor).isActive = true
        panel4.topAnchor.constraint(equalTo: panel2.bottomAnchor, constant: 40).isActive = true
        
        
        
        
        pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -10).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        nextButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
    }
    
    
    
    func checkCorrectness(userAnsIndex: Int) -> Bool {
        
        return self.choices[userAnsIndex - 1] == self.answers[self.state]
    }
    
    @objc func press1() {
        panel1.backgroundColor = panelColor
        panel2.backgroundColor = backgrounColor
        panel3.backgroundColor = backgrounColor
        panel4.backgroundColor = backgrounColor
    }
    
    @objc func press2() {
        panel2.backgroundColor = panelColor
        panel1.backgroundColor = backgrounColor
        panel3.backgroundColor = backgrounColor
        panel4.backgroundColor = backgrounColor
        
    }
    
    @objc func press3() {
        panel3.backgroundColor = panelColor
        panel2.backgroundColor = backgrounColor
        panel1.backgroundColor = backgrounColor
        panel4.backgroundColor = backgrounColor
    }
    
    @objc func press4() {
        panel4.backgroundColor = panelColor
        panel2.backgroundColor = backgrounColor
        panel3.backgroundColor = backgrounColor
        panel1.backgroundColor = backgrounColor
    }
    
    func getCurrentAns() -> Int {
        if panel1.backgroundColor == panelColor {
            return 1
        }else if panel2.backgroundColor == panelColor {
            return 2
        }else if panel3.backgroundColor == panelColor {
            return 3
        }else if panel4.backgroundColor == panelColor {
            return 4
        }else{
            return 0
        }
    }
    
    
    @objc func hitNext() {
        //TODO
        let currentAns = self.getCurrentAns()
        if currentAns == 0 {
            return
        }

        if self.checkCorrectness(userAnsIndex: currentAns) {
            if self.state == 2 {
                self.deactivate()
                
                if let navigator = self.navigationController {
                    navigator.popToRootViewController(animated: false)
                }
            }else{
                if let navigator = self.navigationController {
                    navigator.pushViewController(QuestionsViewController(state: self.state + 1), animated: true)
                }
            }
        }else{
            //shake
            self.view.shake(5, withDelta: 7.0)
        }
        
    }
    
    
    func deactivate() {
        print("deactivate alarm")
        self.deactivate()
        // NOTE: deactivate alarm here
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
