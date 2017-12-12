import XCTest
import Foundation
import Testing
import HTTP
@testable import Vapor
@testable import App

/// This file shows an example of testing 
/// routes through the Droplet.

class RouteTests: TestCase {
    let drop = try! Droplet.testable()

    func testThatItHasGETRouteForCategories() throws {
        try drop
            .testResponse(to: .get, at: "api/v1/categories")
            .assertStatus(is: .ok)
    }
    
    func testThatItHasGETRouteForSubcategories() throws {
        try ["1", "2", "3"].forEach { (categoryId) in
            try drop
                .testResponse(to: .get, at: "api/v1/categories/\(categoryId)/subcategories")
                .assertStatus(is: .ok)
        }
    }
}

// MARK: Manifest

extension RouteTests {
    /// This is a requirement for XCTest on Linux
    /// to function properly.
    /// See ./Tests/LinuxMain.swift for examples
    static let allTests = [        
        ("testThatItHasGETRouteForCategories", testThatItHasGETRouteForCategories),
    ]
}
