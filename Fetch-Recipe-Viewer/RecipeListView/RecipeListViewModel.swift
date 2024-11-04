//
//  RecipeListViewModel.swift
//  Fetch-Recipe-Viewer
//
//  Created by Tony Buckner on 11/4/24.
//

import Foundation
import SwiftUI

class RecipeListViewModel: ObservableObject {
    
    @Published var recipeListService: RecipeListService
    @Published var networkError = ""
    
    init(recipeListService: RecipeListService) {
        self.recipeListService = recipeListService
    }
    
    @MainActor
    func setRecipeList() async {
        do {
            try await recipeListService.fetchRecipeList()
        } catch {
            print(Constants.Messages.errorMessage(withError: error))
            networkError = error.localizedDescription
        }
    }
    
    @MainActor
    func refreshRecipeList() async {
        recipeListService.recipeList = nil
        await setRecipeList()
    }
    
}
