import Vapor

final class SubcategoriesController: ResourceRepresentable {
 
    func index(_ request: Request) throws -> ResponseRepresentable {
        let categoryId = try request.parameters.next(String.self)
        
//        let subcategories = subcategoriesController.subcategories(categoryId: categoryId)
        
        return "works"
    }
    
    func makeResource() -> Resource<String> {
        return Resource(index: index)
    }
}
