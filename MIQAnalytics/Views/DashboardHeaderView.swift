//
//  DashboardHeaderView.swift
//  MIQAnalytics
//
//  Created by Girish on 23/01/20.
//  Copyright © 2020 Girish. All rights reserved.
//

//
//  DashboardHeaderView.swift
//  googlMapTutuorial2
//
//  Created by Girish on 22/01/20.
//  Copyright © 2020 akhil. All rights reserved.
//

import UIKit

import Foundation
import UIKit

protocol StoreDelegate {
    func didPressButton(button:UIButton)
}

protocol insightdelegate {
    func didPressnotificationButton(button:UIButton)
    func scanPressnotification()
}

class DashboardHeaderView: UIView {
    var delegate:StoreDelegate!
    var notidelegate: insightdelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.clear
        self.clipsToBounds=true
        self.layer.masksToBounds=true
        setupViews()
    }
    
//    func setData(title: String, img: UIImage, price: String) {
//        lblTitle.text = title + ",  " + price
//        imgView.image = img
//        lblPrice.text = price
//    }
    
    func setupViews() {
        addSubview(containerView)
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.frame.size.width, height: 300, enableInsets:true)
        
//        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
//        containerView.topAnchor.constraint(equalTo: topAnchor).isActive=true
//        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
//        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
        if DataManager.datamanager.darkmode!{
       containerView.backgroundColor = UIColor.init(hexString: "#2C2A2A")
        }
        else{
            containerView.backgroundColor = UIColor.white
        }
        
        containerView.addSubview(loacatePlantbutton)
         containerView.addSubview(scanbuttom)
        containerView.addSubview(Notificationbutton)
        containerView.addSubview(centreLabel)
        loacatePlantbutton.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 30, height: 30, enableInsets: true)
        
        
        containerView.addSubview(locatePlantLabel)
       
        locatePlantLabel.anchor(top: containerView.topAnchor, left: loacatePlantbutton.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: -5, paddingBottom: 0, paddingRight: 0, width: 100, height: 30, enableInsets: true)
        
        loacatePlantbutton.addTarget(self, action: #selector(buttonPress(button:)), for: .touchUpInside)
        
        centreLabel.anchor(top: containerView.topAnchor, left: locatePlantLabel.rightAnchor, bottom: containerView.bottomAnchor, right: nil, paddingTop: 3, paddingLeft: 5, paddingBottom: 3, paddingRight: 0, width: 100, height: 30, enableInsets: true)
        //centreLabel.center.y = self.containerView.center.x
        
        Notificationbutton.addTarget(self, action: #selector(buttonPressnotification(button:)), for: .touchUpInside)
        scanbuttom.addTarget(self, action: #selector(scanPressnotification(button:)), for: .touchUpInside)
        
        //scanbuttom.anchor(top: containerView.topAnchor, left: locatePlantLabel.rightAnchor, bottom: containerView.bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 5, paddingRight: 0, width: 100, height: 30, enableInsets: true)
        
        Notificationbutton.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 5, width: 30, height: 30, enableInsets: true)
//        loacatePlantbutton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
//        loacatePlantbutton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive=true
//        loacatePlantbutton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 30).isActive=true
//        loacatePlantbutton.widthAnchor.constraint(equalToConstant: 70).isActive=true
//        loacatePlantbutton.backgroundColor = UIColor.gray
//
       
    }
    
    @objc func btnMyLocationAction()  {
        print("Location button is pressed")
    }
    
    let containerView: UIView = {
        let v=UIView()
        v.backgroundColor = UIColor.red
        v.translatesAutoresizingMaskIntoConstraints=false
        //v.alpha = 0.5
        
        v.layer.borderWidth  = 2.0
        //  v.layer.borderColor = (UIColor.red as! CGColor)
        v.layer.cornerRadius = 0.25
        
        
        return v
    }()
    
   
    
    let loacatePlantbutton: UIButton = {
        let btn = UIButton()
        //btn.titleLabel?.text = "locate Plant"
        btn.backgroundColor = UIColor.white
       btn.setTitleColor(.green, for: .normal)
       // btn.setTitle(" locate Plant ", for: .normal)
      //  btn.setImage(UIImage(named: "twoo"), for: .normal)
      if DataManager.datamanager.darkmode!{
       btn.setImage(UIImage(named: "twoo"), for: .normal)
      }
      else{
           btn.setImage(UIImage(named: "twoo2"), for: .normal)
      }
     
        return btn
    }()
    
    public let locatePlantLabel : UILabel = {
           let lbl = UILabel()
           lbl.textColor = .lightGray
           lbl.font = UIFont(name: "Apple SD Gothic Neo", size: 12)
           lbl.textAlignment = .left
           lbl.backgroundColor = UIColor.clear
        lbl.text = "Locate Plant"
           return lbl
       }()
    
    public let centreLabel : UILabel = {
              let lbl = UILabel()
              lbl.textColor = .lightGray
              lbl.font = UIFont(name: "Apple SD Gothic Neo", size: 12)
              lbl.textAlignment = .left
              lbl.backgroundColor = UIColor.clear
           lbl.text = "Dashboard"
              return lbl
          }()
    
    let dashboardButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.text = "locate Plant"
        
        return btn
    }()
    
    
     private let scanbuttom : UIButton = {
               let lblbtn = UIButton()
               lblbtn.titleLabel?.textColor = UIColor.black
               lblbtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
               lblbtn.titleLabel?.textAlignment = .left
               lblbtn.backgroundColor = UIColor.red
               lblbtn.setTitleColor(UIColor.black, for: .normal)
             lblbtn.setTitle(" scan ", for: .normal)
         //let btnImage = UIImage(named: "goldnoti")
       //  lblbtn.setImage(btnImage , for: .normal)
        // lblbtn.imageView?.image = UIImage.image
               return lblbtn
               }()
       
    
    let Notificationbutton: UIButton = {
        let btn = UIButton()
         //btn.titleLabel?.text = "locate Plant"
         btn.backgroundColor = UIColor.white
        btn.setTitleColor(.green, for: .normal)
        // btn.setTitle(" locate Plant ", for: .normal)
        if DataManager.datamanager.darkmode!{
         btn.setImage(UIImage(named: "goldnoti"), for: .normal)
        }
        else{
             btn.setImage(UIImage(named: "onee2"), for: .normal)
        }
        return btn
    }()
    
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func buttonPress(button:UIButton) {
        delegate.didPressButton(button: button)
    }
    
    @objc func buttonPressnotification(button:UIButton) {
        notidelegate.didPressnotificationButton(button: button)
    }
    
    @objc func scanPressnotification(button:UIButton) {
        notidelegate.scanPressnotification()
    }
    
}






