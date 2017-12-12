protocol CategoriesStorageInterface {
    func all() -> [[String: String]]
}

class CategoriesStorage: CategoriesStorageInterface {
    func all() -> [[String: String]] {
        return [["id": "artists", "name": "Artists"],
                ["id": "albums", "name": "Albums"],
                ["id": "genre", "name": "Genre"]]
    }
}
