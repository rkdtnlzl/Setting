//
//  BaseViewController.swift
//  Setting
//
//  Created by 강석호 on 7/20/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureHierarchy()
        configureView()
        configureConstraints()
        configureTarget()
    }
     
    func configureHierarchy() { }
    
    func configureView() { }
    
    func configureConstraints() { }
    
    func configureTarget() { }
}
