//
//  Fetch_Recipe_ViewerTests.swift
//  Fetch-Recipe-ViewerTests
//
//  Created by Tony Buckner on 11/4/24.
//

import XCTest
@testable import Fetch_Recipe_Viewer

final class Fetch_Recipe_ViewerTests: XCTestCase {
    
    // MARK: - Test Cases
    
    func testRecipeListViewModelFetchPopulation() async throws {
        guard let requestResponse = HTTPURLResponse(url: URL(string: "test")!, statusCode: 200, httpVersion: "", headerFields: [:]) else { return }
        let networkManager = makeNetworkManagerSUT(response: requestResponse, recipeListModel: mockRecipeList)
        let recipeListService = RecipeListService(networkManager: networkManager)
        let viewModel = RecipeListViewModel(recipeListService: recipeListService)
        await viewModel.setRecipeList()
        XCTAssertTrue(!(viewModel.recipeListService.recipeList?.recipes.isEmpty ?? true))
        XCTAssertTrue(viewModel.recipeListService.recipeList?.recipes[0].cuisine == "Japanese")
        XCTAssertTrue(viewModel.recipeListService.recipeList?.recipes[1].cuisine == "Mexican")
        XCTAssertTrue(viewModel.recipeListService.recipeList?.recipes[2].cuisine == "Italian")
        XCTAssertTrue(viewModel.recipeListService.recipeList?.recipes[3].cuisine == "American")
    }
    
    func testRecipeListViewModelRefreshPopulation() async throws {
        guard let requestResponse = HTTPURLResponse(url: URL(string: "test")!, statusCode: 200, httpVersion: "", headerFields: [:]) else { return }
        let networkManager = makeNetworkManagerSUT(response: requestResponse, recipeListModel: mockRecipeList)
        let recipeListService = RecipeListService(networkManager: networkManager)
        let viewModel = RecipeListViewModel(recipeListService: recipeListService)
        await viewModel.refreshRecipeList()
        XCTAssertTrue(!(viewModel.recipeListService.recipeList?.recipes.isEmpty ?? true))
        XCTAssertTrue(viewModel.recipeListService.recipeList?.recipes[0].name == "Volcano Tornado Roll")
        XCTAssertTrue(viewModel.recipeListService.recipeList?.recipes[1].name == "Quesadilla con Oaxaca")
        XCTAssertTrue(viewModel.recipeListService.recipeList?.recipes[2].name == "Marinaria Pizza")
        XCTAssertTrue(viewModel.recipeListService.recipeList?.recipes[3].name == "Franks Hot Buffalo Wings")
    }
    
    func testRecipeListViewModelFetchEmpty() async throws {
        guard let requestResponse = HTTPURLResponse(url: URL(string: "test")!, statusCode: 200, httpVersion: "", headerFields: [:]) else { return }
        let nilRecipeList: RecipeListModel? = nil
        let networkManager = makeNetworkManagerSUT(response: requestResponse, recipeListModel: nilRecipeList)
        let recipeListService = RecipeListService(networkManager: networkManager)
        let viewModel = RecipeListViewModel(recipeListService: recipeListService)
        await viewModel.setRecipeList()
        XCTAssertTrue(viewModel.recipeListService.recipeList?.recipes == nil)
    }
    
    func testRecipeListBadRequest() async throws {
        guard let requestResponse = HTTPURLResponse(url: URL(string: "test")!, statusCode: 400, httpVersion: "", headerFields: [:]) else { return }
        let nilRecipeList: RecipeListModel? = nil
        let networkManager = makeNetworkManagerSUT(response: requestResponse, recipeListModel: nilRecipeList)
        let recipeListService = RecipeListService(networkManager: networkManager)
        let viewModel = RecipeListViewModel(recipeListService: recipeListService)
        await viewModel.setRecipeList()
        XCTAssertTrue(viewModel.networkError == NetworkError.badRequest.localizedDescription)
    }
    
    func testRecipeListUnauthorizedRequest() async throws {
        guard let requestResponse = HTTPURLResponse(url: URL(string: "test")!, statusCode: 401, httpVersion: "", headerFields: [:]) else { return }
        let nilRecipeList: RecipeListModel? = nil
        let networkManager = makeNetworkManagerSUT(response: requestResponse, recipeListModel: nilRecipeList)
        let recipeListService = RecipeListService(networkManager: networkManager)
        let viewModel = RecipeListViewModel(recipeListService: recipeListService)
        await viewModel.setRecipeList()
        XCTAssertTrue(viewModel.networkError == NetworkError.unauthorized.localizedDescription)
    }
    
    func testRecipeListPaymentRequiredRequest() async throws {
        guard let requestResponse = HTTPURLResponse(url: URL(string: "test")!, statusCode: 402, httpVersion: "", headerFields: [:]) else { return }
        let nilRecipeList: RecipeListModel? = nil
        let networkManager = makeNetworkManagerSUT(response: requestResponse, recipeListModel: nilRecipeList)
        let recipeListService = RecipeListService(networkManager: networkManager)
        let viewModel = RecipeListViewModel(recipeListService: recipeListService)
        await viewModel.setRecipeList()
        XCTAssertTrue(viewModel.networkError == NetworkError.paymentRequired.localizedDescription)
    }
    
    func testRecipeListForbiddenRequest() async throws {
        guard let requestResponse = HTTPURLResponse(url: URL(string: "test")!, statusCode: 403, httpVersion: "", headerFields: [:]) else { return }
        let nilRecipeList: RecipeListModel? = nil
        let networkManager = makeNetworkManagerSUT(response: requestResponse, recipeListModel: nilRecipeList)
        let recipeListService = RecipeListService(networkManager: networkManager)
        let viewModel = RecipeListViewModel(recipeListService: recipeListService)
        await viewModel.setRecipeList()
        XCTAssertTrue(viewModel.networkError == NetworkError.forbidden.localizedDescription)
    }
    
    func testRecipeListNotFoundRequest() async throws {
        guard let requestResponse = HTTPURLResponse(url: URL(string: "test")!, statusCode: 404, httpVersion: "", headerFields: [:]) else { return }
        let nilRecipeList: RecipeListModel? = nil
        let networkManager = makeNetworkManagerSUT(response: requestResponse, recipeListModel: nilRecipeList)
        let recipeListService = RecipeListService(networkManager: networkManager)
        let viewModel = RecipeListViewModel(recipeListService: recipeListService)
        await viewModel.setRecipeList()
        XCTAssertTrue(viewModel.networkError == NetworkError.notFound.localizedDescription)
    }
    
    func testRecipeListRequestEntityTooLargeRequest() async throws {
        guard let requestResponse = HTTPURLResponse(url: URL(string: "test")!, statusCode: 413, httpVersion: "", headerFields: [:]) else { return }
        let nilRecipeList: RecipeListModel? = nil
        let networkManager = makeNetworkManagerSUT(response: requestResponse, recipeListModel: nilRecipeList)
        let recipeListService = RecipeListService(networkManager: networkManager)
        let viewModel = RecipeListViewModel(recipeListService: recipeListService)
        await viewModel.setRecipeList()
        XCTAssertTrue(viewModel.networkError == NetworkError.requestEntityTooLarge.localizedDescription)
    }
    
    func testRecipeListUnprocessableEntityRequest() async throws {
        guard let requestResponse = HTTPURLResponse(url: URL(string: "test")!, statusCode: 422, httpVersion: "", headerFields: [:]) else { return }
        let nilRecipeList: RecipeListModel? = nil
        let networkManager = makeNetworkManagerSUT(response: requestResponse, recipeListModel: nilRecipeList)
        let recipeListService = RecipeListService(networkManager: networkManager)
        let viewModel = RecipeListViewModel(recipeListService: recipeListService)
        await viewModel.setRecipeList()
        XCTAssertTrue(viewModel.networkError == NetworkError.unprocessableEntity.localizedDescription)
    }
    
    // MARK: - Test Mock Data
    
    let mockRecipeList = RecipeListModel(recipes: [RecipeModel(cuisine: "Japanese",
                                                               name:  "Volcano Tornado Roll",
                                                               photo_url_large:  "",
                                                               photo_url_small:  "",
                                                               source_url:  "www.volcanotornado.com",
                                                               uuid:  "122345678899",
                                                               youtube_url:  "www.youtube.com/volcanotornadorecipe"),
                                                   RecipeModel(cuisine: "Mexican",
                                                               name:  "Quesadilla con Oaxaca",
                                                               photo_url_large:  "",
                                                               photo_url_small:  "",
                                                               source_url:  "www.quesadilla.com",
                                                               uuid:  "1220876345699",
                                                               youtube_url:  "www.youtube.com/Quesadilla"),
                                                   RecipeModel(cuisine: "Italian",
                                                               name:  "Marinaria Pizza",
                                                               photo_url_large:  "",
                                                               photo_url_small:  "",
                                                               source_url:  "www.marinarapizza.com",
                                                               uuid:  "345345433678899",
                                                               youtube_url:  "www.youtube.com/marinarapizza"),
                                                   RecipeModel(cuisine: "American",
                                                               name:  "Franks Hot Buffalo Wings",
                                                               photo_url_large:  "",
                                                               photo_url_small:  "",
                                                               source_url:  "www.wings.com",
                                                               uuid:  "9887535638373",
                                                               youtube_url:  "www.youtube.com/wings")])
    
    // MARK: - Subject Under Test
    
    func makeNetworkManagerSUT(response: HTTPURLResponse,
                               recipeListModel: RecipeListModel? = nil) -> NetworkManagerProtocol {
        
        return StubNetworkManager(response: response,
                                  recipeListModel: recipeListModel)
        
    }
    
}
