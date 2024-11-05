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
    @Published var presentNetworkError = false
    
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
            delayErrorMessage()
        }
    }
    
    /// This is needed to have a smooth pulldown animation when the alert gets presented to prevent sticking
    private func delayErrorMessage() {
        let delayTime: DispatchTime = .now()+0.5
        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
            self.presentNetworkError = true
        })
    }
    
}
