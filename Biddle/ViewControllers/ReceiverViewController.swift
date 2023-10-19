import UIKit
import FirebaseFirestore

class ReceiverViewController: UIViewController {

    var user: User!
    var listener: ListenerRegistration?

    override func viewDidLoad() {
        super.viewDidLoad()

        user.role = .receiver
        FirebaseManager.shared.setRole(for: user)
        listenForColorChanges()
    }

    func listenForColorChanges() {
        listener = FirebaseManager.shared.listenForColorChanges { [weak self] color in
            guard let strongSelf = self else { return }
            
            switch color {
            case .yellow:
                strongSelf.view.backgroundColor = .yellow
            case .blue:
                strongSelf.view.backgroundColor = .blue
            }
        }
    }

    deinit {
        listener?.remove() // Cleanup listener when the view is deinitialized
    }
}
