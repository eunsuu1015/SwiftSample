//
//  FileMgr.swift
//  FileManager
//
//  Created by EunSu on 2022/08/04.
//

import Foundation

// 폴더 생성
func createFolder() {
    let fileManager = FileManager.default
    // 도큐먼트 URL
    let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    // 도큐먼트 URL에 생성할 폴더
    let directoryURL = documentURL.appendingPathComponent("Test")
    do {
        // 폴더 생성
        try fileManager.createDirectory(atPath: directoryURL.path, withIntermediateDirectories: false, attributes: nil)
    } catch let e as NSError {
        print(e.localizedDescription)
    }
}

// 파일 생성
func createFile() {
    let fileManager = FileManager.default
    let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    let directoryURL = documentURL.appendingPathComponent("Test")
    
    // 생성할 파일명 (확장자 필수)
    let fileName = directoryURL.appendingPathComponent("Hello.txt")
    // 파일에 넣은 텍스트
    let text = "Hello World!"
    
    do {
        // 파일 생성
        try text.write(to: fileName, atomically: false, encoding: .utf8)
    } catch let e as NSError {
        print(e.localizedDescription)
    }
}

// createFolder()
// createFile()
