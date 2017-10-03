import Vapor

protocol TagsStorage {
    func all() -> [[String: String]]
}

class TagsController: ResourceRepresentable {
    
    private let tagsStorage: TagsStorage
    
    init(tagsStorage: TagsStorage) {
        self.tagsStorage = tagsStorage
    }
    
    func index(_ request: Request) throws -> ResponseRepresentable {
//        return JSON(StructuredData.string("some string"))
//        return try Post.all().makeJSON()
        let tags = tagsStorage.all()
        return JSON(StructuredData.array(tags.map({ (tag) -> StructuredData in
            return StructuredData.object(["name" : StructuredData.string(tag["name"]!)])
        })))
    }
    
    func store(_ req: Request) throws -> ResponseRepresentable {
        let post = try req.post()
        try post.save()
        return post
    }
    
    func makeResource() -> Resource<Post> {
        return Resource(index: index)
    }
}
