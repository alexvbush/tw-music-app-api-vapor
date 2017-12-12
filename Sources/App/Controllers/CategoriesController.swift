import Vapor

class CategoriesController: ResourceRepresentable {
    
    private let categoriesStorage: CategoriesStorageInterface
    
    init(categoriesStorage: CategoriesStorageInterface) {
        self.categoriesStorage = categoriesStorage
    }
    
    func index(_ request: Request) throws -> ResponseRepresentable {
        let categories = categoriesStorage.all()
        let categoryViewModels = categories.map { return CategoryViewModel($0) }
        let categoriesJSON = try categoryViewModels.map { try $0.makeJSON() }
        
        var jsonResponse = JSON()
        try jsonResponse.set("categories", categoriesJSON)
        
        return jsonResponse
    }

    func makeResource() -> Resource<String> {
        return Resource(index: index)
    }
}
