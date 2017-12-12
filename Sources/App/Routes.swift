import Vapor

extension Droplet {
    func setupRoutes() throws {
        
        let categoriesStorage = CategoriesStorage()
        let categoriesController = CategoriesController(categoriesStorage: categoriesStorage)
        grouped("api").grouped("v1").get("categories", handler: categoriesController.index)
        
        let subcategoriesStorage = SubcategoriesStorage()
        let subcategoriesController = SubcategoriesController(subcategoriesStorage)
        grouped("api").grouped("v1").get("categories", String.parameter, "subcategories",
                                         handler: subcategoriesController.index)        
    }
}
