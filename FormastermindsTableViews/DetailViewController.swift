//
//  DetailViewController.swift
//  FormastermindsTableViews
//
//  Created by WuQiang on 2017/3/4.
//  Copyright © 2017年 WuQiang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleItem: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
    
    @IBOutlet weak var nutritionItem: UITextView!
    
    
    var selected: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selected != nil {
            let item = AppData.items[selected]
            if let data = AppData.details[item] {
                titleItem.text = item
                imageItem.image = UIImage(named: data[0])
                nutritionItem.text = data[1]
            }
        }
    }
    
    @IBAction func deleteItem(_ sender: Any) {
        let title = AppData.items[selected]
        AppData.details.removeValue(forKey: title)
        AppData.items.remove(at: selected)
        _ = navigationController?.popViewController(animated: true)
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
