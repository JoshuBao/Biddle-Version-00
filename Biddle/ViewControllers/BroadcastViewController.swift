import UIKit

class BroadcastViewController: UIViewController {
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()

        user.role = .broadcaster
        FirebaseManager.shared.setRole(for: user)
        updateUIForCurrentColor()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        user.currentColor.toggle()
        FirebaseManager.shared.updateColor(for: user, to: user.currentColor)
        updateUIForCurrentColor()
    }
    

    
    func updateUIForCurrentColor() {
        switch user.currentColor {
            case .yellow:
                view.backgroundColor = .yellow
            case .blue:
                view.backgroundColor = .blue
        }
    }
}
