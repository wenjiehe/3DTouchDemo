//
//  ContentViewController.swift
//  3DTouchDemo-Swift
//
//  Created by 贺文杰 on 2019/7/1.
//  Copyright © 2019 贺文杰. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        check3DTouch()
    }
    
    deinit
    {
        CCLog("销毁成功")
    }
    
    @IBAction func tap(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }
    
    func check3DTouch()
    {
        guard self.traitCollection.forceTouchCapability != UIForceTouchCapability.available else {
            return
        }
    }

    //MARK: - 生成快捷功能菜单
    override var previewActionItems: [UIPreviewActionItem]{
        get{
            let action1 : UIPreviewAction = UIPreviewAction.init(title: "number1", style: .default) { (action, vc) in
                
            }
            let action2 : UIPreviewAction = UIPreviewAction.init(title: "number2", style: .selected) { (action, vc) in
                
            }
            return [action1, action2]
//            let group : UIPreviewActionGroup = UIPreviewActionGroup.init(title: "action group", style: .default, actions: [action1, action2])
//            return [group]
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
