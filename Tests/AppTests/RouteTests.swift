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

    func testInfo() throws {
        try drop
            .testResponse(to: .get, at: "info")
            .assertStatus(is: .ok)
            .assertBody(contains: "0.0.0.0")
    }
    
    func testThatItHasGETrouteForTags() throws {
        // given
        let config = try Config(arguments: ["vapor", "--env=test"])
        try config.setup()
        let server = try Droplet(config)
        try server.setup()
        
        // when
        let doesContainTagsRoute = drop.router.routes.contains { (route) -> Bool in
            return route.contains("tags")
        }
        
        // then
        XCTAssertTrue(doesContainTagsRoute)
    }
}

// MARK: Manifest

extension RouteTests {
    /// This is a requirement for XCTest on Linux
    /// to function properly.
    /// See ./Tests/LinuxMain.swift for examples
    static let allTests = [        
        ("testInfo", testInfo),
    ]
}
