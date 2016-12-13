//
//  EnglishViewController.swift
//  Vocabulary1207
//
//  Created by yaya on 2016/12/7.
//  Copyright © 2016年 yaya. All rights reserved.
//

import UIKit

class EnglishViewController: UIViewController {

    var alphabet:String = ""
    var lineArray = [""]
    var array = [""]
    var vocabularIndex = 0 //第幾筆資料
    
    
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var sentenceLabel: UILabel!
    
    @IBAction func prevBtn(_ sender: Any) {
        vocabularIndex -= 1
        if vocabularIndex < 0 {
            vocabularIndex = array.count-1
            //如果已經在第一行了～就秀最後一行
        }
        show()
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        vocabularIndex += 1
        if vocabularIndex > array.count-1 {
            vocabularIndex = 0
            //如果已經在第一行了～就秀第一行
        }
        show()
    }
    
    //秀出單字跟句子的主程式
    func show(){
        let line = array[vocabularIndex]
        lineArray = line.components(separatedBy: "\t")//依空白切割資料
        let vocabulary = lineArray[0]
        let sentence = lineArray[2]
        word.text = vocabulary
        sentenceLabel.text = sentence
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = alphabet
        
        let path = Bundle.main.path(forResource: alphabet, ofType: "txt")
        
        let content = try! String(contentsOfFile: path!, encoding:String.Encoding.utf16) //接收路徑跟編碼
        
        array = content.components(separatedBy: "\n")//依斷行切割資料
        
        show()
       
        
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let navController = segue.destination as! UINavigationController
        let chiController = navController.topViewController as! ChineseViewController
        
        chiController.vocabulary = lineArray[1]
        chiController.sentence = lineArray[3]
        chiController.alphabet = alphabet
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
