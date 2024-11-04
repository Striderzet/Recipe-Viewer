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
                    
                    if let sourceUrl = recipe.source_url {
                        Link(Constants.Strings.website, destination: URL(string: sourceUrl)!)
                            .font(.system(size: Constants.RecipeCardSettings.mediumFontSize))
                            .underline()
                    }
                    
                    if let youTube = recipe.youtube_url {
                        Link(Constants.Strings.video, destination: URL(string: youTube)!)
                            .font(.system(size: Constants.RecipeCardSettings.mediumFontSize))
                            .underline()
                    }
                    
                }
                
            }
            .frame(minWidth: .zero, maxWidth: .infinity, alignment: .leading)
            .padding()
            
        }
        .padding()
        .background(Color.white)
        
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
