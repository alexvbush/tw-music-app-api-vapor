import Vapor

class CategoriesController: ResourceRepresentable {
    
    private let categoriesStorage: CategoriesStorageInterface
    
    init(categoriesStorage: CategoriesStorageInterface) {
        self.categoriesStorage = categoriesStorage
    }
    
    func index(_ request: Request) throws -> ResponseRepresentable {
        let categories = categoriesStorage.all()
        
        return JSON(["categories": StructuredData.array(categories.map({ (category) -> StructuredData in
            return StructuredData.object([
                "id": StructuredData.string(category["id"]!),
                "name" : StructuredData.string(category["name"]!)
                ])
        }))])
    }

    func makeResource() -> Resource<String> {
        return Resource(index: index)
    }
}
