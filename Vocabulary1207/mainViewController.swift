//
//  mainViewController.swift
//  Vocabulary1207
//
//  Created by yaya on 2016/12/7.
//  Copyright © 2016年 yaya. All rights reserved.
//

import UIKit

class mainViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let but = sender as! UIButton
        let controller = segue.destination as!
        EnglishViewController
        controller.alphabet = but.currentTitle!
    
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
