import UIKit

class HomeViewController: UIViewController {
    
    var user: User!

  
    @IBAction func didTapBroadcast(_ sender: Any) {
        if let broadcasterVC = storyboard?.instantiateViewController(withIdentifier: "BroadcastViewController") as? BroadcastViewController {
            broadcasterVC.user = self.user
            navigationController?.pushViewController(broadcasterVC, animated: true)
        }
    }

    @IBAction func didTapReceive(_ sender: Any) {
        if let receiverVC = storyboard?.instantiateViewController(withIdentifier: "ReceiverViewController") as? ReceiverViewController {
            receiverVC.user = self.user
            navigationController?.pushViewController(receiverVC, animated: true)
        }
    }
}
