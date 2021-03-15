import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        guard let email = emailTextfield.text else { return }
        guard let password = passwordTextfield.text else { return }
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorLabel.text = error.localizedDescription
            } else {
                // Navigate to ChatViewController
                self.performSegue(withIdentifier: Constants.registerSegue, sender: self)
            }
        }
    }
    
}
