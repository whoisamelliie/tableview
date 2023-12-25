//
//  TableViewController.swift
//  tableview
//
//  Created by Amelie Baimukanova on 25.12.2023.
//

import UIKit

class TableViewController: UITableViewController {
    //let array = [1, 2, 3, 4, 5]
//    var arrayName = ["Aomine" , "Murasakibara", "Akashi", "Kise", "Midarima"]
//    var arraySurname = ["Daike", "Atsushi", "Seidzhyra", "Reta", "Shintaru"]
//    var arrayImage = ["aomine", "muras", "akashi", "kise", "midarima"]
var arrayPerson = [Person(name: "Aomine", surname: "Daike", imagename: "aomine"),
                   Person(name: "Murasakibara", surname: "Atsushi", imagename: "muras"),
                   Person(name: "Akashi", surname: "Seidzhyra", imagename: "akashi"),
                   Person(name: "Kise", surname: "Reta", imagename: "kise"),
                   Person(name: "Midarima", surname: "Shintaru", imagename: "midarima")
]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func addPerson(_ sender: Any) {
//        arrayName.append("name")
//        arraySurname.append("surname")
//        arrayImage.append("avatar")
        arrayPerson.append(Person(name: "name", surname: "surname", imagename: "avatar"))
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPerson.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let lable = cell.viewWithTag(1000) as! UILabel
        lable.text = arrayPerson[indexPath.row].name
        
        let lableSurname = cell.viewWithTag(1001) as! UILabel
        lableSurname.text = arrayPerson[indexPath.row].surname
        
        let imageview = cell.viewWithTag(1002) as! UIImageView
        imageview.image = UIImage(named: arrayPerson[indexPath.row].imagename)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = storyboard?.instantiateViewController(identifier: "detailViewController") as! ViewController
        
//        detailVc.name = arrayPerson[indexPath.row].name
//        detailVc.surname = arrayPerson[indexPath.row].surname
//        detailVc.imagename = arrayPerson[indexPath.row].imagename
        detailVc.person = arrayPerson[indexPath.row]
        navigationController?.show(detailVc, sender: self)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
//            arrayName.remove(at: indexPath.row)
//            arraySurname.remove(at: indexPath.row)
//            arrayImage.remove(at: indexPath.row)
            
            arrayPerson.remove(at: indexPath.row)
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
