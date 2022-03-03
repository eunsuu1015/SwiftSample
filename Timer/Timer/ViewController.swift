//
//  ViewController.swift
//  Timer
//
//  Created by EunSu on 2022/03/03.
//

import UIKit

class ViewController: UIViewController {
    
    var timerRepeat: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        startRepeatTimer()
    }
    
    // MARK: - 시작
    
    // 1회성 타이머 시작
    func startTimer() {
        let userInfo = "Timer 1"
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerFire(timer:)), userInfo: userInfo, repeats: false)
    }
    
    // 반복 타이머 시작
    func startRepeatTimer() {
        let userInfo = "Timer 2"
        timerRepeat = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFireRepeat(timer:)), userInfo: userInfo, repeats: true)
    }
    
    // MARK: - 실행
    
    // 1회성 타이머 실행
    @objc func timerFire(timer: Timer) {
        print("timerFire!")
        if timer.userInfo != nil {
            print("\(String(describing: timer.userInfo))")  // Timer 1
        }
    }
    
    // 반복 타이머 실행
    @objc func timerFireRepeat(timer: Timer) {
        print("timerFireRepeat!")
        if timer.userInfo != nil {
            print("\(String(describing: timer.userInfo))")  // Timer 2
        }
    }
    
    // MARK: - 종료
    
    // 반복 타이머 종료
    @IBAction func stopRepeatTimer(_ sender: Any) {
        if let timer = timerRepeat {
            if timer.isValid {
                timer.invalidate()
            }
            timerRepeat = nil
        }
    }
    
}

