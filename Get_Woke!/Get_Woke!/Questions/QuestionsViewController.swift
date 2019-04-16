//
//  QuestionsViewController.swift
//  Get_Woke!
//
//  Created by Tomoki Takasawa on 4/15/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
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
    
    init(state: Int) {
        self.state = state
        self.currentAns = 0
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.configure()
        self.constrain()
    }
    
    func configure(){
        panel1.backgroundColor = .lightGray
        panel1.layer.borderColor = UIColor.lightGray.cgColor
        panel1.layer.borderWidth = 2
        panel1.translatesAutoresizingMaskIntoConstraints = false
        panel1.setTitle(choices[0], for: .normal)
        panel1.titleLabel?.textColor = .darkGray
        panel1.addTarget(self, action: #selector(self.press1), for: .touchUpInside)
        
        panel2.backgroundColor = .lightGray
        panel2.layer.borderColor = UIColor.lightGray.cgColor
        panel2.layer.borderWidth = 2
        panel2.translatesAutoresizingMaskIntoConstraints = false
        panel2.setTitle(choices[1], for: .normal)
        panel2.titleLabel?.textColor = .darkGray
        panel2.addTarget(self, action: #selector(self.press2), for: .touchUpInside)
        
        panel3.backgroundColor = .lightGray
        panel3.layer.borderColor = UIColor.lightGray.cgColor
        panel3.layer.borderWidth = 2
        panel3.translatesAutoresizingMaskIntoConstraints = false
        panel3.setTitle(choices[2], for: .normal)
        panel3.titleLabel?.textColor = .darkGray
        panel3.addTarget(self, action: #selector(self.press3), for: .touchUpInside)
        
        panel4.backgroundColor = .lightGray
        panel4.layer.borderColor = UIColor.lightGray.cgColor
        panel4.layer.borderWidth = 2
        panel4.translatesAutoresizingMaskIntoConstraints = false
        panel4.setTitle(choices[3], for: .normal)
        panel4.titleLabel?.textColor = .darkGray
        panel4.addTarget(self, action: #selector(self.press4), for: .touchUpInside)
        
        titleLabel.text = questions[self.state]
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .black
        
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.backgroundColor = .red
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.titleLabel?.textColor = .white
        nextButton.addTarget(self, action: #selector(self.hitNext), for: .touchUpInside)
    }
    
    func constrain(){
        titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        panel1.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 40).isActive = true
        panel1.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: -40).isActive = true
        panel1.heightAnchor.constraint(equalTo: panel1.widthAnchor).isActive = true
        panel1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        
        
        
        panel2.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 40).isActive = true
        panel2.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -40).isActive = true
        panel2.heightAnchor.constraint(equalTo: panel2.widthAnchor).isActive = true
        panel2.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        
        
        panel3.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 40).isActive = true
        panel3.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -40).isActive = true
        panel3.heightAnchor.constraint(equalTo: panel3.widthAnchor).isActive = true
        panel3.topAnchor.constraint(equalTo: panel1.bottomAnchor, constant: 40).isActive = true
        
        
        panel4.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 40).isActive = true
        panel4.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: -40).isActive = true
        panel4.heightAnchor.constraint(equalTo: panel4.widthAnchor).isActive = true
        panel4.topAnchor.constraint(equalTo: panel2.bottomAnchor, constant: 40).isActive = true
        
        
        nextButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 280).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
    }
    
    
    
    func checkCorrectness(userAnsIndex: Int) -> Bool {
        
        return self.choices[userAnsIndex - 1] == self.answers[self.state]
    }
    
    @objc func press1() {
        panel1.backgroundColor = .white
        panel2.backgroundColor = .lightGray
        panel3.backgroundColor = .lightGray
        panel4.backgroundColor = .lightGray
    }
    
    @objc func press2() {
        panel2.backgroundColor = .white
        panel1.backgroundColor = .lightGray
        panel3.backgroundColor = .lightGray
        panel4.backgroundColor = .lightGray
        
    }
    
    @objc func press3() {
        panel3.backgroundColor = .white
        panel2.backgroundColor = .lightGray
        panel1.backgroundColor = .lightGray
        panel4.backgroundColor = .lightGray
    }
    
    @objc func press4() {
        panel4.backgroundColor = .white
        panel2.backgroundColor = .lightGray
        panel3.backgroundColor = .lightGray
        panel1.backgroundColor = .lightGray
    }
    
    func getCurrentAns() -> Int {
        if panel1.backgroundColor == .white {
            return 1
        }else if panel2.backgroundColor == .white {
            return 2
        }else if panel3.backgroundColor == .white {
            return 3
        }else if panel4.backgroundColor == .white {
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
            if let navigator = self.navigationController {
                navigator.pushViewController(QuestionsViewController(state: self.state), animated: true)
            }
        }
        
    }
    
    func deactivate() {
        print("deactivate alarm")
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
