//
//  Constants.swift
//  Fetch-Recipe-Viewer
//
//  Created by Tony Buckner on 11/4/24.
//

import Foundation

struct Constants {
    
    enum URL: String {
        case recipesJson = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        case recipesMalformedJson = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
        case recipesEmptyJson = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    }
    
    struct EmployeeCardSettings {
        static let mainImageSize: CGFloat = 100
        static let smallFontSize: CGFloat = 10
        static let mediumFontSize: CGFloat = 12
        static let smallSpacing: CGFloat = 2
        static let mediumSpacing: CGFloat = 8
        static let minimunBioScale: CGFloat = 0.3
        static let roundRectWidth: CGFloat = 20
        static let roundRectHeight: CGFloat = 10
    }
    
}
