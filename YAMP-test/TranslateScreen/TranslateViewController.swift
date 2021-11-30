import UIKit

class TranslateViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    let service: VerySecretTranslateService = VerySecretTranslateService()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func translateButtonDidTapped(_ sender: Any) {
        self.service.translate(self.textField.text!) { result, error in
            if error != nil {
                self.resultLabel.text = "Error"
            } else {
                self.resultLabel.text = result
            }
        }
    }
}

