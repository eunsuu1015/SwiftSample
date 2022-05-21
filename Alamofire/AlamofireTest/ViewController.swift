//
//  ViewController.swift
//  AlamofireTest
//
//  Created by EunSu on 2022/05/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTest()
        postTest()
        downloadTest()
    }
    
    func getTest() {
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Content-Type":"application/json", "Accept":"application/json"], interceptor: nil, requestModifier: nil)
            .validate(statusCode: 200..<300)
            .response { (response) in
                switch response.result {
                case .success(_):
                    if  let data = response.data {
                        let str = String(decoding: data, as: UTF8.self)
                        print("suc : \(str)")
                    }
                case .failure(let error):
                    print("fail : \(error.responseCode) / \(error.errorDescription)")
                }
            }
    }
    
    func postTest() {
        let url = "https://ptsv2.com/t/d90a5-1653115466/post"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        let param = ["id":"아이디", "pw":"패스워드"] as Dictionary
        
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: param, options: [])
        } catch {
            print("http body error")
        }
        
        AF.request(request).responseString { (response) in
            switch response.result {
            case .success(_):
                if  let data = response.data {
                    let str = String(decoding: data, as: UTF8.self)
                    print("suc : \(str)")
                }
            case .failure(let error):
                print("fail : \(error.responseCode) / \(error.errorDescription)")
            }
        }
    }
    
    func downloadTest() {
        let url = "http://212.183.159.230/10MB.zip"
        let fileManger = FileManager.default
        // 앱 경로
        let appUrl = fileManger.urls(for: .documentDirectory, in: .userDomainMask)[0]
        // 파일 이름 url의 맨 뒤 컴포넌트로 지정 (10MB.zip)
        let fileName: String = URL(string: url)!.lastPathComponent
        // 파일 경로 생성
        let fileUrl = appUrl.appendingPathComponent(fileName)
        // 파일 경로 지정 및 다운로드 옵션 설정 (이전 파일 삭제, 디렉토리 생성)
        let destination: DownloadRequest.Destination = { _, _ in
            return (fileUrl, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        // 다운로드 시작
        AF.download(url, method: .get, parameters: nil, encoding: JSONEncoding.default, to: destination)
            .downloadProgress { (progress) in
                // 프로그래스 수정
                self.progress.progress = Float(progress.fractionCompleted)
                self.label.text = "\(Int(progress.fractionCompleted * 100))%"
            }
            .response { response in
                if response.error != nil {
                    print("파일 다운로드 실패")
                } else {
                    print("파일 다운로드 성공")
                }
            }
    }
}

