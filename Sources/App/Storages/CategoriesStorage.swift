protocol CategoriesStorageInterface {
    func all() -> [Category]
}

final class CategoriesStorage: CategoriesStorageInterface {
    func all() -> [Category] {
        return [
            Category(id: "artists", name: "Artists"),
            Category(id: "albums", name: "Albums"),
            Category(id: "genre", name: "Genre")
        ]
    }
}
