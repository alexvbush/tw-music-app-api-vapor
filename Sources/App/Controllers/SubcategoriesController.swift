import Vapor

final class SubcategoriesController: ResourceRepresentable {
    
    let subcategoriesStorage: SubcategoriesStorageInterface
    
    init(_ subcategoriesStorage: SubcategoriesStorageInterface) {
        self.subcategoriesStorage = subcategoriesStorage
    }
 
    func index(_ request: Request) throws -> ResponseRepresentable {
        let categoryId = try request.parameters.next(String.self)
        
        let subcategories = subcategoriesStorage.subcategories(categoryId: categoryId)
        let subcategoryViewModels = subcategories.map { return SubcategoryViewModel($0) }
        let subcategoriesJSON = try subcategoryViewModels.map { try $0.makeJSON() }

        var jsonResponse = JSON()
        try jsonResponse.set("subcategories", subcategoriesJSON)
        
        return jsonResponse
    }
    
    func makeResource() -> Resource<String> {
        return Resource(index: index)
    }
}
