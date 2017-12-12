import Vapor

final class SubcategoriesController: ResourceRepresentable {
 
    func index(_ request: Request) throws -> ResponseRepresentable {
        print(request)
        return "works"
    }
    
    func makeResource() -> Resource<String> {
        return Resource(index: index)
    }
}
