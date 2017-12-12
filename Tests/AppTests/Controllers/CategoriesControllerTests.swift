import XCTest
import Testing
import HTTP
@testable import App
@testable import Vapor

class FakeCategoriesStorage: CategoriesStorageInterface {
    func all() -> [App.Category] {
        return [
            Category(id: "1", name: "tag1"),
            Category(id: "2", name: "tag2"),
        ]
    }
}

class CategoriesControllerTests: TestCase {
    
    func testThatItReturnsAListOfMainCategories() throws {
        // given
        let fakeCategoriesStorage = FakeCategoriesStorage()
        let controller = CategoriesController(categoriesStorage: fakeCategoriesStorage)
        let request = Request.makeTest(method: .get)
        
        // when
        let response = try controller.index(request).makeResponse()
        let json = response.json
        
        // then
        let categoriesJSON = json?["categories"]
        XCTAssertNotNil(categoriesJSON)
        XCTAssertEqual(categoriesJSON?[0]?["name"], "tag1")
        XCTAssertEqual(categoriesJSON?[1]?["name"], "tag2")
    }
}
