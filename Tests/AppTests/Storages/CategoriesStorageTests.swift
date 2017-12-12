import XCTest
import Testing
@testable import App

class CategoriesStorageTests: TestCase {
    
    func testThatItReturnsMainCategories() throws {
        // given
        let storage = CategoriesStorage()
        // when
        let mainCategories = storage.all()
        // then
        XCTAssertTrue(mainCategories.count == 3)
        XCTAssertEqual(mainCategories[0].name, "Artists")
        XCTAssertEqual(mainCategories[1].name, "Albums")
        XCTAssertEqual(mainCategories[2].name, "Genre")
    }
    
}
