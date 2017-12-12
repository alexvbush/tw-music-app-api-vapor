import JSON

struct SubcategoryViewModel: JSONRepresentable {
    
    private let subcategory: Subcategory
    
    init(_ subcategory: Subcategory) {
        self.subcategory = subcategory
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("id", subcategory.id)
        try json.set("name", subcategory.name)
        try json.set("song_ids", subcategory.songIds)
        return json
    }
}

