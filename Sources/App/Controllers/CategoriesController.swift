import Vapor

protocol CategoriesStorage {
    func all() -> [[String: String]]
}

class CategoriesController: ResourceRepresentable {
    
    private let categoriesStorage: CategoriesStorage
    
    init(categoriesStorage: CategoriesStorage) {
        self.categoriesStorage = categoriesStorage
    }
    
    func index(_ request: Request) throws -> ResponseRepresentable {
//        return JSON(StructuredData.string("some string"))
//        return try Post.all().makeJSON()
        let categories = categoriesStorage.all()
        
        return JSON(["categories": StructuredData.array(categories.map({ (category) -> StructuredData in
            return StructuredData.object(["name" : StructuredData.string(category["name"]!)])
        }))])
    }

    func makeResource() -> Resource<String> {
        return Resource(index: index)
    }
}
