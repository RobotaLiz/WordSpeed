import UIKit

class ScoreViewController: UIViewController {
    
    var score = 0
    
    @IBOutlet weak var AddNameTextView: UITextField!
    @IBOutlet weak var ScoreBoredLabel: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ScoreBoredLabel.text = score.formatted()
        
    }

    @IBAction func SaveScoreButton(_ sender: Any) {
        let entry = ScoreEntry(name: AddNameTextView.text ?? "", score: score)
        HighScoreList.add(entry: entry)
    }
}


