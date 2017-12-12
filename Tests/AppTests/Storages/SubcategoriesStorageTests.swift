import XCTest
import Testing
@testable import App

class SubcategoriesStorageTests: TestCase {
    
    func testThatItReturnsSubcategoriesForGivenArtistsCategoryId() throws {
        // given
        let storage = SubcategoriesStorage()
        let categoryId = "1"
        // when
        let subcategories = storage.subcategories(categoryId: categoryId)
        // then
        XCTAssertTrue(subcategories.count == 3)
        XCTAssertEqual(subcategories[0].name, "Artist 1")
        XCTAssertEqual(subcategories[1].name, "Artist 2")
        XCTAssertEqual(subcategories[2].name, "Artist 3")
    }
    
    func testThatItReturnsSubcategoriesForGivenAlbumsCategoryId() throws {
        // given
        let storage = SubcategoriesStorage()
        let categoryId = "2"
        // when
        let subcategories = storage.subcategories(categoryId: categoryId)
        // then
        XCTAssertTrue(subcategories.count == 3)
        XCTAssertEqual(subcategories[0].name, "Album 1")
        XCTAssertEqual(subcategories[1].name, "Album 2")
        XCTAssertEqual(subcategories[2].name, "Album 3")
    }
    
    func testThatItReturnsSubcategoriesForGivenGenreCategoryId() throws {
        // given
        let storage = SubcategoriesStorage()
        let categoryId = "3"
        // when
        let subcategories = storage.subcategories(categoryId: categoryId)
        // then
        XCTAssertTrue(subcategories.count == 3)
        XCTAssertEqual(subcategories[0].name, "Rap")
        XCTAssertEqual(subcategories[1].name, "Rock")
        XCTAssertEqual(subcategories[2].name, "Pop")
    }
    
}

