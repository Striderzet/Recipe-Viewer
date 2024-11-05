//
//  RecipeCard.swift
//  Fetch-Recipe-Viewer
//
//  Created by Tony Buckner on 11/4/24.
//

import SwiftUI

struct RecipeCard: View {
    
    let recipe: RecipeModel
    
    var body: some View {
        
        HStack {
            
            AnyView(ImageCache.showImage(withURL: recipe.photo_url_small ?? ""))
                .frame(width: Constants.RecipeCardSettings.mainImageSize, height: Constants.RecipeCardSettings.mainImageSize)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: Constants.RecipeCardSettings.roundRectWidth, height: Constants.RecipeCardSettings.roundRectHeight)))
            
            Spacer()
            
            VStack(alignment: .leading, spacing: Constants.RecipeCardSettings.mediumSpacing) {
                
                Text(recipe.name)
                    .minimumScaleFactor(Constants.RecipeCardSettings.minimumScale)
                
                Text(Constants.Strings.cuisine(withValue: recipe.cuisine))
                    .font(.system(size: Constants.RecipeCardSettings.mediumFontSize))
                
                HStack(spacing: Constants.RecipeCardSettings.largeSpacing) {
                    RecipeLinkButton(title: Constants.Strings.website, urlString: recipe.source_url)
                    RecipeLinkButton(title: Constants.Strings.video, urlString: recipe.youtube_url)
                }
                
            }
            .frame(minWidth: .zero, maxWidth: .infinity, alignment: .leading)
            .padding()
            
        }
        .padding()
        .background(Color.white)
        
    }
    
}

// MARK: - Private Components

fileprivate struct RecipeLinkButton: View {
    let title: String
    let urlString: String?
    var body: some View {
        if let url = urlString {
            Link(title, destination: URL(string: url)!)
                .foregroundStyle(.blue)
                .font(.system(size: Constants.RecipeCardSettings.mediumFontSize))
                .underline()
                .buttonStyle(.plain)
        }
    }
}

#Preview {
    RecipeCard(recipe: RecipeModel(cuisine: "Japanese",
                                   name:  "Volcano Tornado Roll",
                                   photo_url_large:  "",
                                   photo_url_small:  "",
                                   source_url:  "www.volcanotornado.com",
                                   uuid:  "122345678899",
                                   youtube_url:  "www.youtube.com/volcanotornadorecipe")
    )
}
