//
//  Expand.swift
//  CollapsableSection
//
//  Created by Appinventiv Technologies on 26/08/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

protocol ExpandHeaderView{
    
    func Toggle(header: Expand, section:Int)
}
class Expand: UITableViewHeaderFooterView {

    var delegate : ExpandHeaderView?
    var section :Int?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGesture1)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func custom(section:Int, delegate : ExpandHeaderView)
    {
        self.delegate = delegate
        self.section = section
        
    }
  
    
    @objc func tapGesture1(gestureRecognizer: UITapGestureRecognizer)  {
       
       
        let cell = gestureRecognizer.view as? Expand
        
      
       
        delegate?.Toggle(header: self, section: (cell?.section)!)
    }
    
    
   
}
