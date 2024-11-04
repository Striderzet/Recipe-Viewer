//
//  RecipeListView.swift
//  Fetch-Recipe-Viewer
//
//  Created by Tony Buckner on 11/4/24.
//

import SwiftUI

struct RecipeListView: View {
    
    @StateObject var recipeListViewModel: RecipeListViewModel
    
    var body: some View {
        ScrollView {
            
            VStack {
                if let recipes = recipeListViewModel.recipeListService.recipeList?.recipes,
                   !recipes.isEmpty {
                    ForEach(recipes, id:\.self) { recipe in
                        RecipeCard(recipe: recipe)
                    }
                } else {
                    Text(Constants.Messages.emptyRecipeListStateMessage)
                        .padding()
                }
            }
            .padding()
            .task {
                await recipeListViewModel.setRecipeList()
            }
            
        }
        .refreshable {
            await recipeListViewModel.refreshRecipeList()
        }
    }
}

#Preview {
    RecipeListView(recipeListViewModel: RecipeListViewModel(recipeListService: RecipeListService(networkManager: NetworkManager())))
}
