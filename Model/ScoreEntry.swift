import Foundation

struct ScoreEntry : Codable{
    var name : String
    var score : Int
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}


class HighScoreList{
    static var allScoresList : [ScoreEntry] = []
    static let highScoreKey = "highscore"
    
    static func add(entry : ScoreEntry) {
        
        if(allScoresList.count == 0){
            allScoresList = getScore()
        }
        
        allScoresList.append(entry)
        do {
            let encoder = JSONEncoder()

            let data = try encoder.encode(allScoresList)

            UserDefaults.standard.set(data, forKey: highScoreKey)

        } catch {
            print("Cant encode! \(error) ")
        }
        
    }
    static func getScore() -> [ScoreEntry] {
        
        if let data = UserDefaults.standard.data(forKey: highScoreKey) {
            do {
                let decoder = JSONDecoder()

                let allScores = try decoder.decode([ScoreEntry].self, from: data)
                
                return allScores.sorted(by: { $0.score > $1.score })

            } catch {
                print("cant decode! \(error) ")
            }
        }
        
        return allScoresList
    }
}
