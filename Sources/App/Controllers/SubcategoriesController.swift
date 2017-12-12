import Vapor

final class SubcategoriesController: ResourceRepresentable {
    
    let subcategoriesStorage: SubcategoriesStorageInterface
    
    init(_ subcategoriesStorage: SubcategoriesStorageInterface) {
        self.subcategoriesStorage = subcategoriesStorage
    }
 
    func index(_ request: Request) throws -> ResponseRepresentable {
        let categoryId = try request.parameters.next(String.self)
        
        let subcategories = subcategoriesStorage.subcategories(categoryId: categoryId)
        
        let subcategoriesJSON = subcategories.map({ (subcategory) -> StructuredData in
            let songIds = subcategory.songIds.map({ (songId) -> StructuredData in
                return StructuredData.number(StructuredData.Number.int(songId))
            })
            
            return StructuredData.object([
                "id": StructuredData.string(subcategory.id),
                "name" : StructuredData.string(subcategory.name),
                "song_ids" : StructuredData.array(songIds)
                ])
        })
        
        return JSON(["subcategories": StructuredData.array(subcategoriesJSON)])
    }
    
    func makeResource() -> Resource<String> {
        return Resource(index: index)
    }
}
