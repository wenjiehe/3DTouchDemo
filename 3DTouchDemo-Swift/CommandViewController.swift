//
//  CommandViewController.swift
//  3DTouchDemo-Swift
//
//  Created by 贺文杰 on 2019/7/1.
//  Copyright © 2019 贺文杰. All rights reserved.
//

import UIKit

class CommandViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    deinit
    {
        CCLog("销毁成功")
    }
    
    @IBAction func tap(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
