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

    func listenForColorChanges(completion: @escaping (UserColor) -> Void) -> ListenerRegistration {
        return db.collection("users").whereField("role", isEqualTo: UserRole.broadcaster).addSnapshotListener { (snapshot, error) in
            
            guard let documents = snapshot?.documents, let firstDoc = documents.first else {
                print("No broadcaster found or error occurred.")
                return
            }
            
            let data = firstDoc.data()
            if let currentColor = data["currentColor"] as? UserColor {
                completion(currentColor)
            }
        }
    }



    
}
