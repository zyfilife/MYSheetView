//
//  ViewController.swift
//  MYSheetView
//
//  Created by 朱益锋 on 2017/1/14.
//  Copyright © 2017年 朱益锋. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePickerButton: UIButton!
    
    var direction = PrensentaionDirection.left
    
    let slideInPrensentationDelegate = SlideInPrensentationDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.datePickerButton.layer.cornerRadius = 3
        self.datePickerButton.layer.borderColor = self.datePickerButton.titleLabel?.textColor.cgColor
        self.datePickerButton.layer.borderWidth = 1
        self.datePickerButton.layer.masksToBounds = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showDatePicker(_ sender: UIButton) {
        let viewController = MainHelper.instantiateViewControllerWithIdentifier(MainHelper.kDatePickerViewController) as! DatePickerViewController
        viewController.name = "DatePicker"
        viewController.currentDate = nil
        self.slideInPrensentationDelegate.direction = self.direction
        self.slideInPrensentationDelegate.customHeight = 260
        self.slideInPrensentationDelegate.customWidth = self.view.frame.size.width - 50*2
        self.slideInPrensentationDelegate.disableCompactHeight = true
        viewController.transitioningDelegate = self.slideInPrensentationDelegate
        viewController.modalPresentationStyle = .custom
        self.present(viewController, animated: true, completion: nil)
    }

    @IBAction func chooseDirection(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.direction = .left
        case 1:
            self.direction = .top
        case 2:
            self.direction = .right
        case 3:
            self.direction = .bottom
        case 4:
            self.direction = .center
        default:
            break
        }
    }
    

}

