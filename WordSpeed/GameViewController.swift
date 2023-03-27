import UIKit

class GameViewController: UIViewController {
    
   override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1 , repeats: true, block: {_ in self.TimerCounter()})
        CurrentWordLabel.text = GameWordList.choosenList.randomElement()
    }
    var totalGameCounter = 60
    var counter = 10
    var timer: Timer?
    var score = 0
    
    @IBAction func ResetGameButton(_ sender: Any) {
        resetTimeAndWord()
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1 , repeats: true, block: {_ in self.TimerCounter()})
        resetScore()
        
       
       
    }
   
    @IBOutlet weak var GameCounterLabel: UILabel!
   
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
    
        totalGameCounter -= 1
        GameCounterLabel.text = totalGameCounter.formatted()
        
        if totalGameCounter == 0 {
            showToast(message: "End Of Game ! ", font: .systemFont(ofSize: 17.0))
            timer?.invalidate()
        }
        
        
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
        if counter <= 5 {
            GameTimer.textColor = .red
        }else{
            GameTimer.textColor = .white
        }
    }
    func resetTimeAndWord () {
        GameTimer.text = "10"
        GameTimer.textColor = .white
        CurrentWordLabel.text = GameWordList.choosenList.randomElement()
        counter = 10
        WWTExtField.text = ""
    }
    func checkWrongOrRight() {
        if totalGameCounter == 0 {
            return 
        }
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
    func resetScore () {
       score = 0
        ScoreLabel.text = score.formatted()
    }
    func countdownTimerForTheWholeGame () {
       
    }
}

