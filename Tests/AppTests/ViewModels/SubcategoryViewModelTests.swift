import XCTest
import Testing
@testable import App

class SubcategoryViewModelTests: TestCase {
    
    var viewModel: SubcategoryViewModel!
    
    override func setUp() {
        super.setUp()
        
        let subcategory = Subcategory(id: "1", categoryId: "2", name: "subcategory 1", songIds: [1,2,3])
        viewModel = SubcategoryViewModel(subcategory)
    }
    
    func testThatItReturnsTheRightJSON() throws {
        // given
        // when
        let json = try viewModel.makeJSON()
        // then
        XCTAssertEqual(try json.get("id"), "1")
        XCTAssertEqual(try json.get("name"), "subcategory 1")
        XCTAssertEqual(try json.get("song_ids"), [1,2,3])
    }
}

