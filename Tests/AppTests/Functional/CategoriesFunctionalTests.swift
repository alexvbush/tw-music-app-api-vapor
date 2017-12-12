import XCTest
import Testing
import HTTP
@testable import Vapor
@testable import App

class CategoriesFunctionalTests: TestCase {
    
    let drop = try! Droplet.testable()
    
    func testThatItRerturnsAListOfCategories() throws {
        try drop
            .testResponse(to: .get, at: "api/v1/categories")
            .assertStatus(is: .ok)
            .assertJSON("categories", passes: { (caregories) -> (Bool) in
                return caregories.array != nil
            })
            .assertJSON("categories", equals: JSON([["name": "Artists"], ["name": "Albums"], ["name": "Genre"]]))            
    }
}

// MARK: Manifest

extension CategoriesFunctionalTests {
//    static let allTests = [
//        ("testThatItRerturnsAListOfCategories", testThatItRerturnsAListOfCategories),
//        ]
}
