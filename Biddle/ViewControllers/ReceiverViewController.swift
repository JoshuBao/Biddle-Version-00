import UIKit

class ReceiverViewController: UIViewController {

    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        user.role = .receiver
        FirebaseManager.shared.setRole(for: user)
        listenForColorChanges()
    }

    func listenForColorChanges() {
        FirebaseManager.shared.listenForColorChanges { [weak self] color in
            self?.view.backgroundColor = color == .yellow ? .yellow : .blue
        }
    }
}
