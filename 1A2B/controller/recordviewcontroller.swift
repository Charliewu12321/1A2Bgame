import UIKit

class recordviewcontroller: UIViewController {
    
    

    @IBOutlet weak var recordscrollview: UIScrollView!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
           let records = defaults.array(forKey: "records") as? [[String: Any]] ?? []
           
           // 創建相應的標籤
           var y: CGFloat = 0
           let padding: CGFloat = 10
           let labelWidth = recordscrollview.frame.width / 3 - padding
           let labelHeight: CGFloat = 30
           for record in records {
               let label1 = UILabel(frame: CGRect(x: padding, y: y, width: 200, height: labelHeight))
               label1.text = record["date"] as? String
               label1.font = UIFont.systemFont(ofSize: 20)
               recordscrollview.addSubview(label1)
               
               let label2 = UILabel(frame: CGRect(x: labelWidth + padding * 2, y: y, width: 200, height: labelHeight))
               label2.text = record["result"] as? String
               label2.font = UIFont.systemFont(ofSize: 20)
               recordscrollview.addSubview(label2)
               
               let label3 = UILabel(frame: CGRect(x: labelWidth * 2 + padding * 3, y: y, width: labelWidth, height: labelHeight))
               label3.text = "           \(record["guessCount"] as! Int)"
               label3.font = UIFont.systemFont(ofSize: 20)
               recordscrollview.addSubview(label3)
               
               y += labelHeight + padding
           }
        
       }
    
    
    
    @IBAction func startNewGame(_ sender: UIButton) {
        self.performSegue(withIdentifier: "gotonewgame", sender: self)
    }
    
    @IBAction func backToMenu(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
   
   
}


