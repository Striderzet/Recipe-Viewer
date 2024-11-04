//
//  RecipeListService.swift
//  Fetch-Recipe-Viewer
//
//  Created by Tony Buckner on 11/4/24.
//

import Foundation
import SwiftUI

final class RecipeListService: ObservableObject {
    
    @Published var recipeList: RecipeListModel?
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    @MainActor
    func fetchRecipeList() async throws {
        recipeList = try await networkManager.fetchData(fromEndpoint: .recipesJson, toType: RecipeListModel.self)
    }
}
