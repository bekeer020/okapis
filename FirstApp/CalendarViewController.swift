


import UIKit

class Wail:UIViewController
{
    
    @IBOutlet var myDate1: UIDatePicker!
    @IBOutlet var myDate2: UIDatePicker!
    override func viewDidLoad() {
        
    }
    
    @IBAction func changAnother(_ sender: UIDatePicker) {
        let d=sender.date
        let x=d.addingTimeInterval(3*24*60*60)
        myDate2.setDate(x, animated: true)
        
        
    }
    
}
