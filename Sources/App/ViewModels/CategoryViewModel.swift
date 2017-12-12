import JSON

struct CategoryViewModel: JSONRepresentable {

    private let category: Category
    
    init(_ category: Category) {
        self.category = category
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", category.id)
        try json.set("name", category.name)
        return json
    }
}
