//
//  ContentView.swift
//  Fetch-Recipe-Viewer
//
//  Created by Tony Buckner on 11/4/24.
//

import SwiftUI

struct ContentView: View {
    
    // Dependency Injected Services
    @StateObject var recipeListService = RecipeListService(networkManager: NetworkManager())
    
    var body: some View {
        RecipeListView(recipeListViewModel: RecipeListViewModel(recipeListService: recipeListService))
    }
}

#Preview {
    ContentView()
}
