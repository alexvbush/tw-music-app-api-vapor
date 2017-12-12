import XCTest
import Testing
import HTTP
@testable import App
@testable import Vapor

class SubcategoriesControllerTests: TestCase {
    
    func testThatItReturnsAListOfSubcategoriesForAGivenCategory() throws {
        // given
        let controller = SubcategoriesController()
        let request = Request.makeTest(method: .get)
        // NOTE: this is a really stupid autogenerated name for categoryId param. Need to figure out how to substitute it with something more error prone.
        try request.parameters.set("string", "category_id_1")
        
        // when
        let response = try controller.index(request).makeResponse()
        let json = response.json
        
        // then
        let subcategoriesJSON = json?["subcategories"]
        XCTAssertNotNil(subcategoriesJSON)
        XCTAssertEqual(subcategoriesJSON?[0]?["name"], "subcategory 1")
        XCTAssertEqual(subcategoriesJSON?[1]?["name"], "subcategory 2")
    }
}

