import UIKit

class HomeViewController: UIViewController {

 
    @IBAction func didTapBroadcast(_ sender: Any) {
        let broadcasterVC = BroadcastViewController()
        present(broadcasterVC, animated: true)
    }
    
    @IBAction func didTapReceive(_ sender: Any) {
        let receiverVC = ReceiverViewController()
        present(receiverVC, animated: true)
    }

}
