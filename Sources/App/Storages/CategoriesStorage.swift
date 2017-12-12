protocol CategoriesStorageInterface {
    func all() -> [[String: String]]
}

class CategoriesStorage: CategoriesStorageInterface {
    func all() -> [[String: String]] {
        return [["name": "Artists"], ["name": "Albums"], ["name": "Genre"]]
    }
}
