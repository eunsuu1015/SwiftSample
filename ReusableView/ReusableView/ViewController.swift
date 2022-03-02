//
//  ViewController.swift
//  ReusableView
//
//  Created by EunSu on 2022/03/02.
//

import UIKit

class ViewController: UIViewController, ReusableViewDelegate {

    @IBOutlet weak var reusableView: ReusableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reusableView.delegate = self
        reusableView.label.text = "test label"
    }

    func btnClick() {
        // ReusableView 버튼 클릭됨
        print("btnClick")
    }

}

