import Firebase
import FirebaseFirestore

class FirebaseManager {
    static let shared = FirebaseManager()
    private var db = Firestore.firestore()

    func setRole(for user: User) {
        db.collection("users").document(user.id).setData([
            "role": user.role,
            "currentColor": user.currentColor
        ])
    }

    func updateColor(for user: User, to color: UserColor) {
        db.collection("users").document(user.id).updateData([
            "currentColor": color
        ])
    }

    func listenForColorChanges(completion: @escaping (UserColor) -> Void) {
        db.collection("users").whereField("role", isEqualTo: UserRole.broadcaster).addSnapshotListener { (snapshot, error) in
            // Handle snapshot and call completion with the new color
        }
    }
}
