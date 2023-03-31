import UIKit

class TableViewController: UITableViewController {
    
    var highscoreList : [ScoreEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        highscoreList = HighScoreList.getScore()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highscoreList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let entry = highscoreList[indexPath.row]
        cell.textLabel?.text = "\(entry.score) \(entry.name)"
        return cell
    }
}
