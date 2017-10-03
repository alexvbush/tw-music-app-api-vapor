import XCTest
import Testing
import HTTP
@testable import App
@testable import Vapor

import FluentProvider

class FakeTagsStorage: TagsStorage {
    func all() -> [[String: String]] {
        return [["name": "tag1"], ["name": "tag2"]]
    }
}

class TagsControllerTests: TestCase {
    
    func testThatItReturnsAListOfTags() throws {
        // given
        let fakeTagsStorage = FakeTagsStorage()
        let controller = TagsController(tagsStorage: fakeTagsStorage)
        let request = Request.makeTest(method: .get)
        
        // when
        let response = try controller.index(request).makeResponse()
        let json = response.json
        
        // then
        XCTAssertNotNil(json)
        XCTAssertEqual(json![0]!["name"], "tag1")
        
//        let json = try Post.all().makeJSON()
//        print(json)
        
//        print(JSON(StructuredData.string("some string")))
    }
   
}
