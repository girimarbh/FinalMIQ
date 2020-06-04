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
        self.backgroundColor=UIColor.black
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
            cell.updateCellContentt(kpiPopupElement: self.kpipopuparray[indexPath.row])
            return cell
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
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
        v.image=#imageLiteral(resourceName: "quality_icon")
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

class NotificationPopupCell: UITableViewCell {

        var delegatepopup : NotificationInsigtview?
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


    private let notificationLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .green
        UIFont(name: "Apple SD Gothic Neo", size: 20)
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor.clear
        return lbl
    }()
    
    private let notificationContentLabel : UILabel = {
           let lbl = UILabel()
           lbl.textColor = .white
          UIFont(name: "Apple SD Gothic Neo", size: 14)
           lbl.textAlignment = .center
           lbl.backgroundColor = UIColor.clear
       
        lbl.numberOfLines = 0

        lbl.preferredMaxLayoutWidth = 700

        lbl.lineBreakMode = NSLineBreakMode.byWordWrapping

        lbl.sizeToFit()
           return lbl
       }()


        



    

    var properties = ["United States","Mexico","Canada"]
    var values = [1000.0,2000.0,3000.0]

    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.white
        addSubview(containerView)
        containerView.addSubview(notificationLabel)
            containerView.addSubview(notificationContentLabel)
      
        updateUII()
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


        func updateCellContentt(kpiPopupElement : Insights )
    {
        
        notificationLabel.text = kpiPopupElement.header
        notificationContentLabel.text = kpiPopupElement.insight
    }

        @objc func pressed(_ sender: UIButton)  {
            var DataDict:[String: String] = ["data" : sender.accessibilityLabel!]
             self.delegatepopup?.NotifyInsightview(str: "abc")
            print("Button is pressed for insigt insightsss)")
        }


    func updateUII(){
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.frame.width, height: self.frame.height, enableInsets: true)

        notificationLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 10.0, paddingLeft: 10.0, paddingBottom: 0, paddingRight: 10, width: 100.0, height: 40.0, enableInsets: true)
        
        notificationContentLabel.anchor(top: notificationLabel.bottomAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 100, height: 0, enableInsets: true)
        
        }
    
    

    }





