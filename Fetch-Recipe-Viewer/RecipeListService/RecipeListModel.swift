//
//  RecipeListModel.swift
//  Fetch-Recipe-Viewer
//
//  Created by Tony Buckner on 11/4/24.
//

import Foundation

struct RecipeModel: Codable, Hashable {
    let cuisine: String
    let name: String
    let photo_url_large: String?
    let photo_url_small: String?
    let source_url: String?
    let uuid: String
    let youtube_url: String?
}

struct RecipeListModel: Codable, Hashable {
    let recipes: [RecipeModel]
}
