import UIKit

class GameViewController: UIViewController {
    
    var score = 0
    @IBOutlet weak var WWTExtField: UITextField!
    
    
    @IBAction func WriteWordTextField(_ sender: UITextField) {
        if (CurrentWordLabel.text == WWTExtField.text) {
            CurrentWordLabel.text = GameWordList.ListOfWords.randomElement()
            score += 1
            print("Score!!!" + score.formatted())
            
        }else{
            print("Wrong Word my Dear!")
            score -= 1
            print("looose!!" + score.formatted())
            
        }
        WWTExtField.text = ""
    }
    
    @IBOutlet weak var CurrentWordLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CurrentWordLabel.text = GameWordList.ListOfWords.randomElement()
    }
    
}
