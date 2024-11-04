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
                .frame(width: Constants.EmployeeCardSettings.mainImageSize, height: Constants.EmployeeCardSettings.mainImageSize)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: Constants.EmployeeCardSettings.roundRectWidth, height: Constants.EmployeeCardSettings.roundRectHeight)))
            
            Spacer()
            
            VStack(alignment: .leading, spacing: Constants.EmployeeCardSettings.mediumSpacing) {
                
                Text(recipe.name)
                    .minimumScaleFactor(Constants.EmployeeCardSettings.minimumScale)
                
                Text(Constants.Strings.cuisine(withValue: recipe.cuisine))
                    .font(.system(size: Constants.EmployeeCardSettings.mediumFontSize))
                
                HStack(spacing: Constants.EmployeeCardSettings.largeSpacing) {
                    
                    if let sourceUrl = recipe.source_url {
                        Link(Constants.Strings.website, destination: URL(string: sourceUrl)!)
                            .font(.system(size: Constants.EmployeeCardSettings.mediumFontSize))
                            .underline()
                    }
                    
                    if let youTube = recipe.youtube_url {
                        Link(Constants.Strings.video, destination: URL(string: youTube)!)
                            .font(.system(size: Constants.EmployeeCardSettings.mediumFontSize))
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
