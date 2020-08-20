//
//  NotificationvView.swift
//  MIQAnalytics
//
//  Created by Girish on 03/06/20.
//  Copyright © 2020 Girish. All rights reserved.
//

import UIKit

class NotificationvView: UIView , UITableViewDelegate , UITableViewDataSource{
        let cellId = "cellIdinsight"
        var kpipopuparray = [Insights]()
        var currentstatus : String?
        var currentcategory : String?
    
        override init(frame: CGRect) {
        super.init(frame: frame)
            if DataManager.datamanager.darkmode! {
           self.backgroundColor=UIColor.black
            }
            else{
                self.backgroundColor = UIColor.init(hexString: "#daecf0")
            }
        //self.backgroundColor=UIColor.black
        self.clipsToBounds=true
        self.layer.masksToBounds=true

        setupViews()

    }

        func setData(popuparray : [Insights] ) {
           self.kpipopuparray = popuparray

//            self.setColors()
            self.table.reloadData()

        }



    @objc func close()  {
        self.kpipopuparray.removeAll()
        self.removeFromSuperview()
    }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.kpipopuparray.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NotificationPopupCell
            cell.updateCellContentt(kpiPopupElement: self.kpipopuparray[indexPath.row], rowvalue: indexPath.row )
            return cell
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Insights"
    }
    

    func setupViews() {

        addSubview(containerView)
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
        containerView.backgroundColor = UIColor.clear

        containerView.addSubview(table)
        table.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive=true
        table.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive=true
        table.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive=true
        table.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive=true
        table.dataSource = self
        table.delegate = self
        table.register(NotificationPopupCell.self, forCellReuseIdentifier: cellId)
        table.separatorStyle = .singleLine

        table.estimatedRowHeight = 100
        table.rowHeight = UITableView.automaticDimension
         table.allowsSelection = false

        
       
        
//
//       containerView.addSubview(closebutton)
//        closebutton.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 30, height: 20, enableInsets: true)
//
//        closebutton.layer.cornerRadius = 9 // this value vary as per your desire
//           closebutton.clipsToBounds = true
//
//        closebutton.addTarget(self, action:  #selector(close), for: .touchUpInside)
    }


    let containerView: UIView = {
        let v=UIView()
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()

    let leftview: UIView = {
        let v=UIView()
        //v.backgroundColor = UIColor(red: 18/255, green: 133/255, blue: 75/255, alpha: 1.0)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    let closebutton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.gray
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle(" close ", for: .normal)
          btn.setImage(UIImage(named: "close"), for: .normal)
        return btn
    }()
    let table : UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints=false
        return table

    }()

    let imgView: UIImageView = {
        let v=UIImageView()
       // v.image=#imageLiteral(resourceName: "quality_icon")
        v.contentMode = .scaleAspectFill
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()

required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    }

protocol NotificationInsigtview {
    func NotifyInsightview (str : String)
   // func updateError()


}

protocol voicebuttonenabled {
    func NotifyVoicebutton (str : Int)
}

class NotificationPopupCell: UITableViewCell {

        var delegatepopup : NotificationInsigtview?
    var voicebuttondelegate : voicebuttonenabled?
        let CalenderimgView: UIImageView = {
            let v=UIImageView()
            v.image=#imageLiteral(resourceName: "calendar")
            v.translatesAutoresizingMaskIntoConstraints=false
            return v
        }()

    let containerView: UIView = {
        let v=UIView()
        v.backgroundColor = UIColor.black
        v.translatesAutoresizingMaskIntoConstraints=false
        v.layer.cornerRadius = 0.25
        return v
    }()

    public let notificationLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .green
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    private let notificationContentLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    private let voiceButton : UIButton = {
              let lblbtn = UIButton()
              lblbtn.titleLabel?.textColor = UIColor.black
              lblbtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
              lblbtn.titleLabel?.textAlignment = .left
              lblbtn.backgroundColor = UIColor.white
              lblbtn.setTitleColor(UIColor.black, for: .normal)
        let btnImage = UIImage(named: "goldnoti")
        lblbtn.setImage(btnImage , for: .normal)
       // lblbtn.imageView?.image = UIImage.image
              return lblbtn
              }()
    
//    private let notificationLabel : UILabel = {
//        let lbl = UILabel()
//        lbl.textColor = .green
//        lbl.font = UIFont.boldSystemFont(ofSize: 16)
//        lbl.textAlignment = .center
//        lbl.numberOfLines = 0
//       // lbl.backgroundColor = UIColor.white
//        return lbl
//    }()
//
//
//    private let notificationContentLabel : UILabel = {
//        let lbl = UILabel()
//        lbl.textColor = .gray
//        lbl.font = UIFont.systemFont(ofSize: 14)
//        lbl.textAlignment = .left
//        lbl.numberOfLines = 0
//        // lbl.backgroundColor = UIColor.white
//        return lbl
//    }()
    
//    private let notificationContentLabel : UILabel = {
//           let lbl = UILabel()
//           lbl.textColor = .white
//          UIFont(name: "Apple SD Gothic Neo", size: 12)
//           lbl.textAlignment = .center
//           lbl.backgroundColor = UIColor.clear
//        lbl.textAlignment = .left
//       lbl.numberOfLines = 0
//lbl.preferredMaxLayoutWidth = 700
//
//        lbl.lineBreakMode = NSLineBreakMode.byWordWrapping
//
//        lbl.sizeToFit()
//           return lbl
//       }()


        



    

    var properties = ["United States","Mexico","Canada"]
    var values = [1000.0,2000.0,3000.0]

    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      //  self.backgroundColor = UIColor.black
            if DataManager.datamanager.darkmode! {
                      self.backgroundColor=UIColor.black
                       }
                       else{
                           self.backgroundColor = UIColor.init(hexString: "#daecf0")
                       }
            
//        addSubview(containerView)
        addSubview(notificationLabel)
        addSubview(voiceButton)
        addSubview(notificationContentLabel)
      
        updateUII()
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func updateCellContentt(kpiPopupElement : Insights , rowvalue : Int )
    {
        
        notificationLabel.text = kpiPopupElement.header
        notificationContentLabel.text = kpiPopupElement.insight
        voiceButton.tag = rowvalue
    }

    
    @objc func voicebuttonpressed(_ sender: UIButton)  {
        var tag = sender.tag
        //self.voicebuttondelegate?.NotifyVoicebutton(str: tag)
        print("Button is pressed voice")
        
        
        var DataDict:[String: Int] = ["data" : sender.tag]
                var btn = sender
                  let nc = NotificationCenter.default
                  nc.post(name: Notification.Name("Voicebutton"), object: nil, userInfo: DataDict)
                   
    }
        @objc func pressed(_ sender: UIButton)  {
            var DataDict:[String: String] = ["data" : sender.accessibilityLabel!]
             self.delegatepopup?.NotifyInsightview(str: "abc")
            print("Button is pressed for insigt insightsss)")
        }


    func updateUII(){
//        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.frame.width, height: self.frame.height, enableInsets: true)

//        notificationLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10.0, paddingLeft: 10.0, paddingBottom: 0, paddingRight: 10, width: 100.0, height: 20.0, enableInsets: true)
        notificationLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 5, width: 0, height: 0, enableInsets: false)
        
        
        notificationContentLabel.anchor(top: notificationLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 0, height: 120, enableInsets: false)
//        notificationContentLabel.anchor(top: notificationLabel.bottomAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 100, height: 0, enableInsets: true)
        
        notificationLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 5, width: 100, height: 0, enableInsets: false)
        
        voiceButton.titleLabel?.text = "voice"
        voiceButton.anchor(top: topAnchor, left: notificationLabel.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 40, height: 40, enableInsets: false)
        voiceButton.addTarget(self, action: #selector(voicebuttonpressed(_:)), for: .touchUpInside)
        
//        if DataManager.datamanager.voiceEnabled!{
//            voiceButton.isHidden = false
//        }
        
        notificationContentLabel.anchor(top: notificationLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 0, height: 0, enableInsets: false)
        
        }
    
    

    }





