struct User {
    let id: String
    var role: UserRole
    var currentColor: UserColor
}

enum UserRole {
    case broadcaster
    case receiver
}

enum UserColor {
    case yellow
    case blue
}

extension UserColor {
    func toggle() -> UserColor {
        return self == .yellow ? .blue : .yellow
    }
}
