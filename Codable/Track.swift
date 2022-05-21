//
//  Track.swift
//  Coadable
//
//  Created by EunSu on 2022/05/21.
//

import Foundation

struct Track: Codable {
    let title: String
    let artistName: String
    let isStreamable: Bool
    
    // CodingKey: Protocol이며, 인코딩/디코딩을 위한 키로 사용할 수 있는 타입
    // JSON 데이터의 key와, 사용하고자 하는 key가 매핑될 수 있도록 사용
//    enum CodingKeys: String, CodingKey {
//        case title = "track_name"
//        case artistName = "artist_name"
//        case isStreamable = "is_streamable"
//    }
}

func encoding() {
    let sampleInput = Track(title: "New Rules", artistName: "Dua Lipa", isStreamable: true)
    
    // encoding
    do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(sampleInput)
        print(data)
        if let jsonString = String(data: data, encoding: .utf8) {
            print(jsonString)
        }
    } catch {
        print(error)
    }
}

func decoding() {
    // enum CodingKey 사용안 할 경우 사용
    let jsonData = """
    {
      "artistName" : "Dua Lipa",
      "isStreamable" : true,
      "title" : "New Rules"
    }
    """.data(using: .utf8)!
    
    // enum CodingKey 사용할 경우 사용
    let jsonCodingKeyData = """
    {
      "artist_name" : "Dua Lipa",
      "is_streamable" : true,
      "track_name" : "New Rules"
    }
    """.data(using: .utf8)!
    
    do {
        let decoder = JSONDecoder()
        let data = try decoder.decode(Track.self, from: jsonData)
        print(data)
        print(data.title)
    } catch {
        print(error)
    }
}
