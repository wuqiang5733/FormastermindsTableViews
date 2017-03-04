//
//  TableViewController.swift
//  FormastermindsTableViews
//
//  Created by WuQiang on 2017/3/4.
//  Copyright © 2017年 WuQiang. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var myTable: UITableView!
    
    var items: [String]!
    
    var images: [String: String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = ["Lettuce", "Tomatoes", "Milk", "Granola", "Donuts", "Cookies", "Butter", "Cheese", "Lemonade", "Yogurt", "Oatmeal", "Juice", "Tea", "Coffee", "Bagels", "Brownies", "Potatoes", "Onions"]
        images = ["Lettuce": "lettuce", "Tomatoes": "tomato", "Milk": "milk", "Granola": "granola", "Donuts": "donuts", "Cookies": "cookies", "Butter": "butter", "Cheese": "cheese", "Lemonade": "lemonade", "Yogurt": "yogurt", "Oatmeal": "oatmeal", "Juice": "juice", "Tea": "tea", "Coffee": "coffee", "Bagels": "bagels", "Brownies": "brownies", "Potatoes": "potato", "Onions": "onions"]
        items.sort(by: { (value1, value2) in value1 < value2 })
        myTable.dataSource = self
        myTable.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! FoodCell
        let row = indexPath.row
        let title = items[row]
        cell.cellTitle.text = title
        
        if let image = images[title] {
            cell.cellImage.image = UIImage(named: image)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
