import XCTest
import Testing
import HTTP
@testable import Vapor
@testable import App

class SubcategoriesFunctionalTests: TestCase {
    let drop = try! Droplet.testable()
    
    func testThatItRerturnsTheRightListOfSubcategoriesForArtistsCategory() throws {
        // given
        let categoryId = "artists"
        
        // when // then
        try drop
            .testResponse(to: .get, at: "api/v1/categories/\(categoryId)/subcategories")
            .assertStatus(is: .ok)
            .assertJSON("subcategories", passes: { (subcategories) -> (Bool) in
                return subcategories.array != nil
            })
            .assertJSON("subcategories", equals: JSON([
                ["id": "1", "name": "Artist 1", "song_ids": [1, 2, 3]],
                ["id": "2", "name": "Artist 2", "song_ids": [4, 5, 6]],
                ["id": "3", "name": "Artist 3", "song_ids": [7, 8, 9]]
                ]))
        
    }
}
