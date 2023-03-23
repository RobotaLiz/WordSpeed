import UIKit

class GameViewController: UIViewController {
 
    var counter = 10
    var timer: Timer?
    var score = 0
   
    @IBOutlet weak var WWTExtField: UITextField!
    
    @IBOutlet weak var GameTimer: UILabel!
    
    @IBOutlet weak var GameCounter: UILabel!
   
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBAction func WriteWordTextField(_ sender: UITextField) {
        if (CurrentWordLabel.text == WWTExtField.text) {
            CurrentWordLabel.text = GameWordList.choosenList.randomElement()
            score += 1
            ScoreLabel.text = score.formatted()
            print("Score!!! " + score.formatted())
            
        }else{
            score -= 1
            ScoreLabel.text = score.formatted()
            print("Wrong word! " + score.formatted())
            
        }
        WWTExtField.text = ""
    }
    
    @IBOutlet weak var CurrentWordLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1 , repeats: true, block: {_ in self.TimerCounter()})
        CurrentWordLabel.text = GameWordList.choosenList.randomElement()
   
    }
    func TimerCounter () {
        
        counter -= 1
        GameTimer.text = counter.formatted()
        
        if counter == 0 {
            print("times up")
            timer?.invalidate()
        
        }
    }
}
