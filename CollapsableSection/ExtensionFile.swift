//
//  ExtensionFile.swift
//  TableViewTesting
//
//  Created by Appinventiv Technologies on 23/08/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

extension FirstPage : UITableViewDataSource, UITableViewDelegate{
    
   
            // Returns Table Cell count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        return  objectArray[section].SectionObjects.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let counter = String(section + 1)
        return counter + ") " + objectArray[section].SectionName
    }
    
        // Returns cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell", for: indexPath) as! TextFieldCell
        
        cell.lblOne.text = objectArray[indexPath.section].labelOne[indexPath.row]
         cell.lblTwo.text = objectArray[indexPath.section].labelTwo[indexPath.row]
        
      cell.imgView.image = UIImage(named : objectArray[indexPath.section].SectionObjects[indexPath.row])
      let text = indexPath.row
      print(text)
      cell.lblCounter.text = String(text+1)
        
       
   
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (objectArray[indexPath.section].expanded!){
            
            return 100
        }
        else{
            return 0
            
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
       
        return 2
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = Expand()
        
        header.custom(section: section, delegate: self)
        return header
    }
   
  
    //   Selected row or cell
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let indexPath = tableView.indexPathForSelectedRow //optional, to get from any UIButton for example

        let currentCell = tableView.cellForRow(at: indexPath!) as! TextFieldCell

        let obj = self.storyboard?.instantiateViewController(withIdentifier: "SecondPage") as! SecondPage
        print(indexPath!)
        obj.transferImage = objectArray[(indexPath?.section)!].SectionObjects[(indexPath?.row)!]

        obj.transferLabel = objectArray[(indexPath?.section)!].labelTwo[(indexPath?.row)!]

        obj.smallImageArr = smallImage
        obj.smallLabel = [objectArray[(indexPath?.section)!].labelOne[(indexPath?.row)!]]

        firstPageTableView.deselectRow(at: indexPath!, animated: true)
        self.navigationController?.pushViewController(obj, animated: true)


}
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
         let cell = self.firstPageTableView.cellForRow(at: indexPath) as! TextFieldCell

        let editAction = UITableViewRowAction(style: .default,title : "Delete" ,handler:{(ACTION,indexPath) in

            print("Row deleted\(indexPath.row)")

            self.objectArray[indexPath.section].SectionObjects.remove(at: indexPath.row)
            self.objectArray[indexPath.section].labelOne.remove(at: indexPath.row )
            self.objectArray[indexPath.section].labelTwo.remove(at: indexPath.row )
            tableView.deleteRows(at: [indexPath], with: .middle)
            tableView.reloadData()
        })

        editAction.backgroundColor = UIColor.init(red: 0.5, green: 1, blue: 0.5, alpha: 0.5)


        let MoreAction = UITableViewRowAction(style: .default,title : "More" ,handler:{(ACTION,indexPath) in

             cell.lblOne.text =  " More Button Clicked"


        })

        let ShareAction = UITableViewRowAction(style: .default,title : "Image" ,handler:{(ACTION,indexPath) in


               cell.lblOne.text =  " ImageButton Button Clicked"
            print("Image Button is Tapped")
        })

        ShareAction.backgroundColor = UIColor.init(red: 0.8, green: 0.5, blue: 0, alpha: 0.5)
        return [editAction,MoreAction,ShareAction]

    }

    // Return String Named
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Erase"
    }
}

