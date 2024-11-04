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
        static let smallSpacing: CGFloat = 4
        static let mediumSpacing: CGFloat = 8
        static let largeSpacing: CGFloat = 16
        static let minimumScale: CGFloat = 0.3
        static let roundRectWidth: CGFloat = 20
        static let roundRectHeight: CGFloat = 10
    }
    
    struct Messages {
        static let emptyRecipeListStateMessage = "There are no recipes available. Pull list down to refresh."
        static func errorMessage(withError error: Error) -> String {
            return "There was an error: \(error)"
        }
    }
    
    struct Strings {
        static func cuisine(withValue val: String) -> String {
            return "Cuisine: \(val)"
        }
        static let website = "Website"
        static let video = "Video"
    }
    
}
