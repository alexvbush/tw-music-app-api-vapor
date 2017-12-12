protocol SubcategoriesStorageInterface {
    func subcategories(categoryId: String) -> [Subcategory]
}

final class SubcategoriesStorage: SubcategoriesStorageInterface {
    
    private var subcategories = [
        Subcategory(id: "1", categoryId: "1", name: "Artist 1", songIds: []),
        Subcategory(id: "2", categoryId: "1", name: "Artist 2", songIds: []),
        Subcategory(id: "3", categoryId: "1", name: "Artist 3", songIds: []),
        
        Subcategory(id: "4", categoryId: "2", name: "Album 1", songIds: []),
        Subcategory(id: "5", categoryId: "2", name: "Album 2", songIds: []),
        Subcategory(id: "6", categoryId: "2", name: "Album 3", songIds: []),
        
        Subcategory(id: "7", categoryId: "3", name: "Rap", songIds: []),
        Subcategory(id: "8", categoryId: "3", name: "Rock", songIds: []),
        Subcategory(id: "9", categoryId: "3", name: "Pop", songIds: [])
    ]
    
    func subcategories(categoryId: String) -> [Subcategory] {
        return subcategories.filter { return $0.categoryId.equals(caseInsensitive: categoryId) }
    }
}
