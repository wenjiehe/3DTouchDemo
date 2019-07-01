//
//  Marco.swift
//  3DTouchDemo-Swift
//
//  Created by 贺文杰 on 2019/7/2.
//  Copyright © 2019 贺文杰. All rights reserved.
//

import Foundation

func CCLog<T>(_ message:T,file:String = #file,funcName:String = #function,lineNum:Int = #line){
    #if DEBUG
    let file = (file as NSString).lastPathComponent;
    let fileName = (file as NSString).deletingPathExtension;
    print("\(fileName):\(funcName)--(\(lineNum))\n\(message)");
    #endif
}
