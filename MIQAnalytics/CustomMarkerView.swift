//
//  CustomMarkerView.swift
//  MIQAnalytics
//
//  Created by Girish on 03/12/19.
//  Copyright © 2019 Girish. All rights reserved.
//

import UIKit

class CustomMarkerView: UIView {
    var img: UIImage!
    var borderColor: UIColor!
    var title : String!
    
    init(frame: CGRect, image: UIImage, borderColor: UIColor, tag: Int , title:String ) {
        super.init(frame: frame)
        self.img=image
        self.borderColor=borderColor
        self.tag = tag
        self.title =  title
        
        
        setupViews()
    }
    
    func setupViews() {
        let imgView = UIImageView(image: img)
        let lbl=UILabel()
        
        
        imgView.frame=CGRect(x: 0, y: 0, width: 100, height: 50)
        lbl.frame  = CGRect(x: 5, y: 0,width: 150,height: 50)
        imgView.layer.borderColor=borderColor?.cgColor
        imgView.layer.borderWidth=2
        imgView.clipsToBounds=true
        lbl.text = title
        lbl.font=UIFont.boldSystemFont(ofSize: 16)
        lbl.textColor=UIColor.white
        lbl.backgroundColor=UIColor.black
        lbl.layer.borderColor = UIColor.green.cgColor;
        lbl.layer.borderWidth = 1.0;
        
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 5
        lbl.clipsToBounds=true
        lbl.translatesAutoresizingMaskIntoConstraints=false
        // self.addSubview(imgView)
        self.addSubview(lbl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
