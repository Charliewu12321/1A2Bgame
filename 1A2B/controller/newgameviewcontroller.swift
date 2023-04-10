import UIKit




class newgameviewcontroller: UIViewController , UITextFieldDelegate{
    var question = gamebrain().randomNumber()
    @IBOutlet weak var youranswer: UIScrollView!
    @IBOutlet weak var yourCode: UITextField!
    @IBOutlet weak var numberOfGuesses: UILabel!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(question)
        yourCode.delegate = self
        
        numberOfGuesses.text = "0"
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 30))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(image: UIImage(systemName: "arrow.down"), style: .done, target: self, action: #selector(doneButtonPressed))
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        yourCode.inputAccessoryView = toolbar
        
        
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func guessPress(_ sender: UIButton) {
        let code = Int(yourCode.text!) ?? 0 // 確保輸入的是數字
        let checkanswer = gamebrain().playGame(guess: code, answer: question)
        let label = UILabel()
                label.text = "\(code): \(checkanswer)"
                label.frame.size = CGSize(width: 200, height: 40)
                label.font = UIFont.systemFont(ofSize: 30)
                label.textAlignment = .center
                label.frame.origin = CGPoint(x: (youranswer.frame.width - label.frame.width) / 2, y: youranswer.contentSize.height)
                youranswer.addSubview(label)//scroll中的label
        youranswer.contentSize.height += label.frame.height
        
        
        let bottomOffset = CGPoint(x: 0, y: youranswer.contentSize.height - youranswer.bounds.size.height)
        youranswer.setContentOffset(bottomOffset, animated: true)
        
        
        numberOfGuesses.text = String(Int(numberOfGuesses.text ?? "0")! + 1)
        
        
        if code == question {
            
            let controller = UIAlertController(title: "You got it!", message: "The answer is \(question)\n  and you guessed \(numberOfGuesses.text!) times", preferredStyle: .alert)
                       let okAction = UIAlertAction(title: "Awesome!", style: .default, handler: { _ in})
                       
                       controller.addAction(okAction)
                       present(controller, animated: true)
            
            
            let defaults = UserDefaults.standard
            
            // 保存猜測的數字、是否猜對以及猜測的次數
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let dateString = formatter.string(from: date)
            let result = "       \(question) "
            let guessCount = Int(numberOfGuesses.text!)!
            
            // 將這些值儲存到NSUserDefaults中
            let record = ["date": dateString, "result": result, "guessCount": guessCount] as [String : Any]
            var records = defaults.array(forKey: "records") as? [[String: Any]] ?? []
            records.insert(record, at: 0)
            defaults.set(Array(records.prefix(20)), forKey: "records")
            defaults.synchronize()
        }//如果答對了
        yourCode.text = ""
    }
    
    @IBAction func restartPress(_ sender: UIButton) {
          question = gamebrain().randomNumber()
          youranswer.subviews.forEach { $0.removeFromSuperview() }//重置scrollview
          numberOfGuesses.text = "0"
          print(question)
    }
    
    
    @IBAction func answerPress(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Don't give up !", message: "Are you sure you want the answer?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            let okAction = UIAlertAction(title: "Yes!", style: .default, handler: { _ in
                let answerAlertController = UIAlertController(title: "The answer is \(self.question)", message: nil, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                answerAlertController.addAction(okAction)
                self.present(answerAlertController, animated: true, completion: nil)
            })
            alertController.addAction(okAction)
            
            present(alertController, animated: true, completion: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = textField.text!.count + string.count - range.length
        return newLength <= 4
    }//限制輸入字數
    
    @objc func doneButtonPressed() {
        yourCode.resignFirstResponder()
    }
}

