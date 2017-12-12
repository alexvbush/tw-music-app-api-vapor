import XCTest
import Testing
import HTTP
@testable import App
@testable import Vapor

import FluentProvider

class FakeCategoriesStorage: CategoriesStorageInterface {
    func all() -> [[String: String]] {
        return [["name": "tag1"], ["name": "tag2"]]
    }
}

class CategoriesControllerTests: TestCase {
    
    func testThatItReturnsAListOfCategories() throws {
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
        
//        let json = try Post.all().makeJSON()
//        print(json)
        
//        print(JSON(StructuredData.string("some string")))
    }
    
    func testThatItReturnsAListOfMainCategories() throws {
        //
    }
   
}
