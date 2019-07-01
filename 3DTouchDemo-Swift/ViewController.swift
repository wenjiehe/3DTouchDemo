//
//  ViewController.swift
//  3DTouchDemo-Swift
//
//  Created by 贺文杰 on 2019/7/1.
//  Copyright © 2019 贺文杰. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIViewControllerPreviewingDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        check3DTouch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CCLog("准备进入界面")
    }
    
    deinit
    {
        CCLog("销毁成功")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        check3DTouch()
    }

    func check3DTouch()
    {
        if self.traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            self.registerForPreviewing(with: self, sourceView: self.view)
        }
    }
    
    func getViewController(name : String, identifier : String) -> UIViewController
    {
        let mainSB : UIStoryboard = UIStoryboard.init(name: name, bundle: nil)
        return mainSB.instantiateViewController(withIdentifier: identifier)
    }
    
    //MARK: UIViewControllerPreviewingDelegate
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let contentVC : UIViewController = getViewController(name: "Main", identifier: "contentVC")
        previewingContext.sourceRect = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        return contentVC
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        let commandVC : UIViewController = getViewController(name: "Main", identifier: "commandVC")
        self.show(commandVC, sender: self)
    }


}

