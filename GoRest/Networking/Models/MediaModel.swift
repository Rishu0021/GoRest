//
//  MediaModel.swift
//  GoRest
//
//  Created by Rishu Gupta on 28/11/20.
//

import Foundation

struct MediaModel {
    let key: String
    let data: Data
    let fileName: String?
    let mimeType: String?

    init?(withFile data: Data, forKey key: String, fileName: String?) {
        self.key = key
        self.data = data
        self.fileName = fileName
        self.mimeType = "*/*"
    }
    
    init?(withValue value: String, forKey key: String) {
        self.key = key
        self.fileName = nil
        self.mimeType = nil

        guard let data = value.data(using: .utf8) else { return nil }
        self.data = data
    }
    
    init?(withData data: Data, forKey key: String) {
        self.key = key
        self.data = data
        self.fileName = nil
        self.mimeType = nil
    }
}
