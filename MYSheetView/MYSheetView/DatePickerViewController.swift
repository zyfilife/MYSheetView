//
//  DatePickerViewController.swift
//  MYSheetView
//
//  Created by 朱益锋 on 2017/1/15.
//  Copyright © 2017年 朱益锋. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var sureButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var name: String? 
    
    var currentDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.contentMode = .bottom
        
        self.titleLabel.text = self.name != nil ? self.name!: nil
        self.datePicker.date = self.currentDate != nil ? self.currentDate!: Date()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickCancelAction(_ sender: UIButton) {
    }
    
    @IBAction func clickSureButtonAction(_ sender: UIButton) {
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
