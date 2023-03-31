import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
 
 

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0 {
            return "Easy"
        }else if row == 1 {
            return "Medium"
        }else{
            return "Hard"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            GameWordList.choosenList = GameWordList.Easy
        }else if row == 1 {
            GameWordList.choosenList = GameWordList.Medium
        }else{
            GameWordList.choosenList = GameWordList.Hard
        }
    }
}
