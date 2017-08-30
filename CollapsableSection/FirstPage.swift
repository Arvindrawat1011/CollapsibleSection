//
//  ViewController.swift
//  TableViewTesting
//
//  Created by Appinventiv Technologies on 23/08/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class FirstPage: UIViewController,ExpandHeaderView{
    func Toggle(header: Expand, section: Int) {
        objectArray[section].expanded = !objectArray[section].expanded!
        
         
        firstPageTableView.reloadData()
        for i in 0..<objectArray[section].SectionObjects.count{
            firstPageTableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .left)
        }
      
    }
    
  @IBOutlet weak var firstPageTableView: UITableView!
    var ex:Int?
   
 
struct Objects {
        var SectionName: String
        var SectionObjects: [String]
        var labelOne :[String]
        var labelTwo :[String]
        var expanded :Bool?
     }
    
     var objectArray = [Objects]()
    
    
    
    
              // first label for cell

    
    
            // Second label for cell
//        var labelTwo = ["Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000"]
    
            // Image Url
//         var Image = ["laptop1","laptop2","laptop3","laptop4","laptop5","laptop6","laptop7","laptop8","laptop9","laptop10","laptop11","laptop12","laptop13"]
    
        let smallImage = ["laptop7","laptop8","laptop9","laptop6"]
    
   
  
  
    
    
    
    
    override func viewDidLoad() {
                    super.viewDidLoad()
        
                    firstPageTableView.dataSource = self
                    firstPageTableView.delegate = self
       
        
objectArray = [Objects(SectionName: "Laptops",
                       SectionObjects:["laptop1","laptop2","laptop3","laptop4","laptop5","laptop6","laptop7","laptop8","laptop9","laptop10","laptop11","laptop12","laptop13"],
                       labelOne:["Mac 13 inch","Acer 13.3 inch","MSI 15.6 inch","HP 15 inch","Samsung 15.6 inch ","Samsung 13.3 inch","HP 15 inch","ASUS 15.6 inch","Sony Vaio 13.3 inch","ASUS 15.6 inch","Lenovo 14.5 inch","ASUS 13.3 inch  ","Samsung 13.3 inch"],
                       labelTwo:["Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000","Rs. 80000"],
                       expanded: false),
               Objects(SectionName: "Phones",
                       SectionObjects:["phone1","phone2","phone3", "phone4","phone5","phone6","phone7","phone8"],
                       labelOne:["1","2","3","4","5","6","7","8"],
                       labelTwo:["1","2","3","4","5","6","7","8"],expanded: false)]
        
                }

            override func didReceiveMemoryWarning() {
                    super.didReceiveMemoryWarning()
        
        
        
                    }
    
}


    
class TextFieldCell: UITableViewCell {
    
            // Outlets of Cell
    
   
    @IBOutlet weak var lblOne: UILabel!
    
    @IBOutlet weak var lblTwo: UILabel!
   
    @IBOutlet weak var lblCounter: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    override func prepareForReuse() {
        super.prepareForReuse()
        
      
    }
    
}
    







