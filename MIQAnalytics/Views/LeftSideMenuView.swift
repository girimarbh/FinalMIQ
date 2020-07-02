//
//  LeftSideMenuView.swift
//  MIQAnalytics
//
//  Created by Girish on 07/05/20.
//  Copyright © 2020 Girish. All rights reserved.
//

import UIKit

protocol Notificationmapbtn {
 func Notifymap()
// func updateError()
 
}

class LeftSideMenuView: UIView {
     var mapdelegate : Notificationmapbtn?
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.clear
        self.clipsToBounds=true
        self.layer.masksToBounds=true
        setupViews()
    }
    
    func setData(title: String, img: UIImage, price: String) {
//        lblTitle.text = title + ",  " + price
//        imgView.image = img
//        lblPrice.text = price
        
        
    }
    
    func setupViews() {
        
        addSubview(containerView)
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        //containerView.heightAnchor.constraint(equalToConstant: 40).isActive=true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
        containerView.backgroundColor = UIColor.black
      //  containerView.alpha = 0.8
//
//        //containerView.addSubview(imgView)
//        imgView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive=true
//        imgView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
//       // imgView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive=tr
//       // imgView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 20).isActive=true
//        imgView.heightAnchor.constraint(equalToConstant: 60).isActive=true
//        imgView.widthAnchor.constraint(equalToConstant: 60).isActive=true
        

       // imgView.makeRounded()
        
         containerView.addSubview(nameLabel)
         nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
         nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive=true
      // nameLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
         nameLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 20).isActive=true
         nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive=true
         //nameLabel.widthAnchor.constraint(equalToConstant: 200).isActive=true
         nameLabel.layer.cornerRadius =  5
        
        containerView.addSubview(lineView)
         lineView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive=true
         lineView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive=true
         lineView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive=true
         lineView.heightAnchor.constraint(equalToConstant: 1).isActive=true
//         //nameLabel.widthAnchor.constraint(equalToConstant: 200).isActive=true
//        // nameLabel.layer.cornerRadius =  5
//
        
//        containerView.addSubview(lblTitle)
//        lblTitle.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
//        lblTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive=true
//        lblTitle.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 10).isActive=true
//        lblTitle.heightAnchor.constraint(equalToConstant: 40).isActive=true
        
        containerView.addSubview(mapMenuButton)
        mapMenuButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 30).isActive=true
        mapMenuButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 05).isActive=true
        mapMenuButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 10).isActive=true
        mapMenuButton.heightAnchor.constraint(equalToConstant: 20).isActive=true
        mapMenuButton.widthAnchor.constraint(equalToConstant: 180).isActive=true

        containerView.addSubview(DashboardButton)
        DashboardButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 30).isActive=true
        DashboardButton.topAnchor.constraint(equalTo: mapMenuButton.bottomAnchor, constant: 05).isActive=true
        DashboardButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 10).isActive=true
        DashboardButton.heightAnchor.constraint(equalToConstant: 20).isActive=true
        DashboardButton.widthAnchor.constraint(equalToConstant: 180).isActive=true


        containerView.addSubview(settingButton)
        settingButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 30).isActive=true
        settingButton.topAnchor.constraint(equalTo: DashboardButton.bottomAnchor, constant: 05).isActive=true
        settingButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 10).isActive=true
        settingButton.heightAnchor.constraint(equalToConstant: 20).isActive=true
        settingButton.widthAnchor.constraint(equalToConstant: 180).isActive=true
        
        
        containerView.addSubview(darkmodelbl)
        containerView.addSubview(switchbtn)
        
        darkmodelbl.anchor(top: settingButton.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 70, height: 20, enableInsets: true)
        switchbtn.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        switchbtn.anchor(top: settingButton.bottomAnchor, left: darkmodelbl.rightAnchor, bottom: nil, right: nil, paddingTop: 2, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 30, height: 30, enableInsets: true)


        
//        containerView.addSubview(lblPrice)
//        lblPrice.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
//        lblPrice.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 0).isActive=true
//        lblPrice.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 10).isActive=true
//        lblPrice.heightAnchor.constraint(equalToConstant: 20).isActive=true
//
//
//        containerView.addSubview(progressView)
//
//        progressView.topAnchor.constraint(equalTo: lblPrice.bottomAnchor, constant: 10).isActive=true
//        progressView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
//        progressView.heightAnchor.constraint(equalToConstant: 10).isActive=true
//        progressView.widthAnchor.constraint(equalToConstant: 350).isActive=true
//
//        containerView.addSubview(percentageLabel)
//        percentageLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 10).isActive=true
//        percentageLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive=true
//        //percentageLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 10).isActive=true
//        percentageLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 50).isActive=true
//        percentageLabel.heightAnchor.constraint(equalToConstant: 25).isActive=true
    }
    
    let containerView: UIView = {
        let v=UIView()
        v.backgroundColor = UIColor.gray
        v.translatesAutoresizingMaskIntoConstraints=false
        
       // v.layer.borderWidth  = 2.0
        //  v.layer.borderColor = (UIColor.red as! CGColor)
        v.layer.cornerRadius = 0.25
        
        
        return v
    }()
    
    let lineView: UIView = {
           let v=UIView()
           v.backgroundColor = UIColor.green
           v.translatesAutoresizingMaskIntoConstraints=false
           //v.layer.borderWidth  = 2.0
           //  v.layer.borderColor = (UIColor.red as! CGColor)
          // v.layer.cornerRadius = 0.25
           
           
           return v
       }()
    
    let switchbtn : UISwitch = {
        let switchbtn = UISwitch()
       switchbtn.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
        switchbtn.setOn(true, animated: false)
      return switchbtn
        
    }()
    
    let darkmodelbl: UILabel = {
        let lbl=UILabel()
        lbl.text = "Dark mode"
       lbl.font = UIFont(name: "Apple SD Gothic Neo", size: 14)!
       // lbl.font=UIFont.boldSystemFont(ofSize: 18)
        lbl.textColor = UIColor.green
       // lbl.backgroundColor = UIColor.gray
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let imgView: UIImageView = {
        let v=UIImageView()
        v.image=#imageLiteral(resourceName: "restaurant1")
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    let lblTitle: UILabel = {
        let lbl=UILabel()
        lbl.text = "     Name"
        lbl.font=UIFont.boldSystemFont(ofSize: 24)
        lbl.textColor = UIColor(hexString: "#1e91ca")
        lbl.backgroundColor = UIColor.clear
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let nameLabel: UILabel = {
        let lbl=UILabel()
        lbl.text = "Hello ," + "Girish@wipro.com"
        lbl.font = UIFont(name: "Apple SD Gothic Neo", size: 12)!
        lbl.textColor = UIColor.red
        lbl.backgroundColor = UIColor.clear
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    
    let lblPrice: UILabel = {
        let lbl=UILabel()
        lbl.text = "Name"
        lbl.font=UIFont.boldSystemFont(ofSize: 18)
        lbl.textColor = UIColor.white
        lbl.backgroundColor = UIColor.clear
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    let percentageLabel: UILabel = {
        let lbl=UILabel()
        lbl.text = "54% healthy"
        lbl.font=UIFont.boldSystemFont(ofSize:20)
        lbl.textColor = UIColor.green
        lbl.backgroundColor = UIColor.clear
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    let mapMenuButton : UIButton = {
        let btn = UIButton()
//        btn.titleLabel?.text = "MAP"
        btn.backgroundColor = UIColor.black
      btn.titleLabel?.textColor = UIColor.green
        
        btn.backgroundColor = UIColor.black
        btn.setTitle("Sales", for: .normal)
        
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo", size: 14)!
        btn.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
       // btn.titleLabel?.textAlignment = .right
        btn.contentHorizontalAlignment = .left
        btn.setTitleColor(.green, for: .normal)
        return btn
        
    }()
    let DashboardButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
         btn.backgroundColor = UIColor.black
        btn.setTitle("Manufacture", for: .normal)
        btn.titleLabel?.textColor = UIColor.green
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo", size: 14)!
        //btn.titleLabel?.textAlignment = .left
        btn.contentHorizontalAlignment = .left
        btn.setTitleColor(.green, for: .normal)
        return btn
        
    }()
    let settingButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.black
        btn.setTitle("Logout", for: .normal)
         btn.titleLabel?.textColor = UIColor.green
         btn.titleLabel?.textAlignment = .left
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo", size: 14)!
        btn.contentHorizontalAlignment = .left
        btn.setTitleColor(.green, for: .normal)
        return btn
        
    }()
    let progressView : UIProgressView = {
        
        let progess = UIView()
        progess.backgroundColor = UIColor.red
        let progressview = UIProgressView(progressViewStyle: .bar)
        progressview.center = progess.center
        progressview.setProgress(0.5, animated: true)
        progressview.trackTintColor = UIColor.white
        progressview.tintColor = UIColor.green
        progressview.backgroundColor = UIColor.green
        progressview.progress = 0.5
        progressview.clipsToBounds = true
        progressview.layer.cornerRadius = 5
        progressview.translatesAutoresizingMaskIntoConstraints=false
        return progressview
        
    }()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // Handle Action

        @objc func handleButton(_ sender: AnyObject) {

//         delegate?.updateContentOnView()
    }
    
    @objc func switchStateDidChange(_ sender:UISwitch){
        if (sender.isOn == true){
            print("UISwitch state is now ON")
           DataManager.datamanager.darkmode = true
            mapdelegate?.Notifymap()
            let nc = NotificationCenter.default
            var DataDict:[String: Bool] = ["data" : DataManager.datamanager.darkmode!]
            nc.post(name: Notification.Name("darkmode"), object: nil, userInfo: DataDict)
        }
        else{
            print("UISwitch state is now Off")
            let nc = NotificationCenter.default
            
           
            DataManager.datamanager.darkmode = false
            var DataDict:[String: Bool] = ["data" : DataManager.datamanager.darkmode!]
             nc.post(name: Notification.Name("darkmode"), object: nil, userInfo: DataDict)
            mapdelegate?.Notifymap()
        }
    }
}


