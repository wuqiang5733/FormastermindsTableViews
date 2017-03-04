//
//  AddItemViewController.swift
//  FormastermindsTableViews
//
//  Created by WuQiang on 2017/3/4.
//  Copyright © 2017年 WuQiang. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var newItem: UITextField!
    
    // 以代理的方式处理保存 Item
    var delegate: TableViewController!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     The popViewController() method returns a reference to the view
     controller that is removed (self in this case). If you ignore that value, as we did
     in the example, Xcode shows you a warning. To remove the
     warning, you can assign the value returned to an underscore, as in 
     _ = navigationController?.popViewController(animated: true). 
     Values assigned to an underscore are ignored by the system.
     */
    /*
    @IBAction func saveItem(_ sender: Any) {
        var text = newItem.text!
        text = text.trimmingCharacters(in: .whitespaces)
        if text != "" {
            let lower = text.lowercased()
            let final = lower.capitalized
            AppData.items.append(final)
            AppData.details[final] = ["noimage", "Not Defined"]
            _ = navigationController?.popViewController(animated: true)
        }
    }
*/
    //下面是以代理的方式处理 保存 Item
    @IBAction func saveItem(_ sender: UIButton) {
        var text = newItem.text!
        text = text.trimmingCharacters(in: .whitespaces)
        if text != "" {
            delegate.saveItem(title: text)
        }
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
