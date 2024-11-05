//
//  RecipeListView.swift
//  Fetch-Recipe-Viewer
//
//  Created by Tony Buckner on 11/4/24.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var recipeListViewModel: RecipeListViewModel
    
    var body: some View {
        
        VStack {
            
            if let recipes = recipeListViewModel.recipeListService.recipeList?.recipes,
               !recipes.isEmpty {
                
                List(recipes, id:\.self) { recipe in
                    RecipeCard(recipe: recipe)
                        .frame(maxWidth: .infinity)
                }
                
            } else {
                ScrollView {
                    VStack {
                        Text(Constants.Messages.emptyRecipeListStateMessage)
                    }
                    .padding(.top, Constants.Values.emptyStateTopPadding)
                }
            }
        }
        .task {
            await recipeListViewModel.setRecipeList()
        }
        .refreshable {
            await recipeListViewModel.setRecipeList()
        }
        .alert(isPresented: $recipeListViewModel.presentNetworkError) {
            Alert(title: Text(Constants.Strings.errorString),
                  message: Text(Constants.Messages.dataError),
                  dismissButton: .default(Text(Constants.Strings.ok)))
        }
        
    }
}


#Preview {
    RecipeListView(recipeListViewModel: RecipeListViewModel(recipeListService: RecipeListService(networkManager: NetworkManager())))
}
