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
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = AppData.items
        return data.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = AppData.items
        let cell = myTable.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    // 下面这个方法是从一个 ControlView 到另一个 ControlView 时用的
    // 如果直接从 prototype cell 拖线到 DetailsView 是不需要这个方法的
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "showDetails", sender: self)
//        print("WQ_Segue Executed!")
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let controller = segue.destination as! DetailViewController
            if let path = myTable.indexPathForSelectedRow {
                controller.selected = path.row
            }
        }else if segue.identifier == "showAddItem" {
            let controller = segue.destination as! AddItemViewController
            controller.delegate = self   // 添加代理 
        }
    }
    /*
     代理的好处是：now the table
     won’t reload its data every time it is shown on the screen 
     but only when new items are available.
     */
    func saveItem(title: String) {
        let lower = title.lowercased()
        let final = lower.capitalized
        AppData.items.append(final)
        AppData.details[final] = ["noimage", "Not Defined"]
        _ = navigationController?.popViewController(animated: true)
        myTable.reloadData()  // 添加元素之后，重新载入数据 显示出来
    }
    
    // 14 - 17
    /*
     一当选中一行，这一行就会一直选中，甚至从 Details 界面当中返回到 TableViews 当中
      viewWillAppear 方法会执行 by the system every time the main view is going to be shown on the screen
     */
    
    /*
     The process adds the item to the model, but the Table View still doesn’t know
     that there are more items available. One way to tell the table to update its content is
     by calling the reloadData() method. In our example, the best moment to call this
     method is when the table is about to be shown on the screen. The following
     example updates the viewWillAppear() method of Listing 14-17 to reload the data
     every time the user comes back to the table.
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let path = myTable.indexPathForSelectedRow {
            myTable.deselectRow(at: path, animated: true)
        }
        myTable.reloadData()  // 添加元素之后，重新载入数据 显示出来(删除完 Item 之后也得用)
    }
    // 点击编辑按钮
    @IBAction func editItems(_ sender: Any) {
        if myTable.isEditing {
            myTable.setEditing(false, animated: true)
        } else {
            myTable.setEditing(true, animated: true)
        }
    }
    // 点击 Edit 按钮之后，再点击出现 的 删除 按钮执行的代码
    // 这个功能直接右划就可以执行
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let row = indexPath.row
            let item = AppData.items[row]
            AppData.details.removeValue(forKey: item)
            AppData.items.remove(at: row)
            
            myTable.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    // 移动元素
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = AppData.items[sourceIndexPath.row]
        AppData.items.remove(at: sourceIndexPath.row)
        AppData.items.insert(item, at: destinationIndexPath.row)
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
