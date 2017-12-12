import XCTest
import Testing
import HTTP
@testable import App
@testable import Vapor

class CategoryViewModelTests: TestCase {
    
    var viewModel: CategoryViewModel!
    
    override func setUp() {
        super.setUp()
        
        let category = Category(id: "some_id", name: "some name")
        viewModel = CategoryViewModel(category)
    }
    
    func testThatItReturnsTheRightJSON() throws {
        // given
        // when
        let json = try viewModel.makeJSON()
        // then
        XCTAssertEqual(try json.get("id"), "some_id")
        XCTAssertEqual(try json.get("name"), "some name")
    }
}
