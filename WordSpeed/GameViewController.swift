import UIKit

class GameViewController: UIViewController {
    
   override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1 , repeats: true, block: {_ in self.TimerCounter()})
        CurrentWordLabel.text = GameWordList.choosenList.randomElement()
    }
    
    var counter = 10
    var timer: Timer?
    var score = 0
    
    @IBOutlet weak var WWTExtField: UITextField!
    
    @IBOutlet weak var GameTimer: UILabel!
    
    @IBOutlet weak var GameCounter: UILabel!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBAction func WriteWordTextField(_ sender: UITextField) {
        
        checkWrongOrRight()
        WWTExtField.text = ""
        resetTimeAndWord()
    }
    @IBOutlet weak var CurrentWordLabel: UILabel!
    
    func TimerCounter () {
        
        counter -= 1
        GameTimer.text = counter.formatted()
        if counter == 0 {
          
            if WWTExtField.text == "" {
                showToast(message: "Game Over !" , font: .systemFont(ofSize: 17.0))
                timer?.invalidate()
            }else{
                checkWrongOrRight()
                resetTimeAndWord()
                showToast(message: "Times Up! ", font: .systemFont(ofSize: 17.0))
            }
            }
    }
    func resetTimeAndWord () {
        GameTimer.text = "10"
        CurrentWordLabel.text = GameWordList.choosenList.randomElement()
        counter = 10
        WWTExtField.text = ""
    }
    func checkWrongOrRight() {
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
        
    }
}
