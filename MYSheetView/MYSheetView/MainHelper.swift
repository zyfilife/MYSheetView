//
//  MainHelper.swift
//  MYSheetView
//
//  Created by 朱益锋 on 2017/1/15.
//  Copyright © 2017年 朱益锋. All rights reserved.
//

import UIKit

class MainHelper {
    
    static let kStoryboardName = "Main"
    static let kDatePickerViewController = "DatePickerViewController"
    
    class func instantiateViewControllerWithIdentifier(_ identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name:MainHelper.kStoryboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        return viewController
    }

}
