import UIKit

class ScoreViewController: UIViewController {
    
    var score = ""
    
    @IBOutlet weak var ScoreBoredLabel: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ScoreBoredLabel.text = score
        
    }

}


