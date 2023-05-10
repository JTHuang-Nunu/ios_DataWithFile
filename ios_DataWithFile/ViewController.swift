//
//  ViewController.swift
//  ios_DataWithFile
//
//  Created by Mac15 on 2023/5/10.
//

import UIKit

class ViewController: UIViewController {
    var arrayTitle: Array<String> = []
    var arrayContent: Array<String> = []
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textContent: UILabel!
    @IBOutlet weak var labelNum: UILabel!
    @IBOutlet weak var stepperBook: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var path = Bundle.main.path(forResource: "01", ofType: "txt")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!))
        let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
        let dataArray = dataString.components(separatedBy: "\n")
        for i in 0...dataArray.count-2 {
            let tempArray = dataArray[i].components(separatedBy: ";")
            arrayTitle.append(tempArray[1])
        }
        
        path = Bundle.main.path(forResource: "02", ofType: "txt")
        let contentData = try? Data(contentsOf: URL(fileURLWithPath: path!))
        let contentString = NSString(data: contentData!, encoding: String.Encoding.utf8.rawValue)! as String
        arrayContent = contentString.components(separatedBy: "\n")
        labelTitle.text = arrayTitle[0]
        textContent.text = arrayContent[0]
        
        stepperBook.minimumValue = 0
        stepperBook.maximumValue = Double(arrayTitle.count) + 1
        stepperBook.value = 1
    }
    @IBAction func stepperChange(_ sender: UIStepper) {
        var num = Int(stepperBook.value)
        if num == arrayTitle.count + 1{
            num = 1
            stepperBook.value = 1
        }else if num == 0{
            num = arrayTitle.count
            stepperBook.value = Double(arrayTitle.count)
        }
        labelTitle.text = arrayTitle[num-1]
        textContent.text = arrayContent[num-1]
        labelNum.text = String(num)
    }
    

}

