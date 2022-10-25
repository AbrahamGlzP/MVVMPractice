//
//  Image.swift
//  MVVMDependencyInversion
//
//  Created by Abraham Gonzalez Puga on 24/10/22.
//

import Foundation

typealias Images = [Image]
// MARK: - Image
struct Image: Codable {
    let id, author: String
    let width, height: Int
    let url, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}
