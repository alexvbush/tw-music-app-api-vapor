import Vapor

class FakeCategoriesStorageForDevelopment: CategoriesStorage {
    func all() -> [[String: String]] {
        return []
    }
}

extension Droplet {
    func setupRoutes() throws {
        
        get("plaintext") { req in
            return "Hello, world!"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
        
        let categoriesStorage = FakeCategoriesStorageForDevelopment()
        let categoriesController = CategoriesController(categoriesStorage: categoriesStorage)
        
        grouped("api").grouped("v1").get("categories", handler: categoriesController.index)
        
    }
}
