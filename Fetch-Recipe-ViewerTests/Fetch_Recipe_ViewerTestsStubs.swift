//
//  Fetch_Recipe_ViewerTestsStubs.swift
//  Fetch-Recipe-ViewerTests
//
//  Created by Tony Buckner on 11/4/24.
//

import Foundation
@testable import Fetch_Recipe_Viewer

struct StubNetworkManagerForRecipeList: NetworkManagerProtocol {
    
    var response: HTTPURLResponse
    var recipeListModel: RecipeListModel?
    
    /// This will test all network errors at the moment, as doing data conversions will take more project time
    func fetchData<T>(fromEndpoint urlString: Constants.URL, toType type: T.Type) async throws -> T where T : Decodable {
        if recipeListModel == nil {
            let data = Data()
            let fetchedData = try JSONDecoder().decode(T.self, from: try NetworkManagerMethods.mapResponse(response: (data, response)))
            return fetchedData
        } else {
            return recipeListModel as! T
        }
    }
    
}
