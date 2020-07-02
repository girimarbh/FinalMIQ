//
//  KPIPopupView.swift
//  MIQAnalytics
//
//  Created by Girish on 31/01/20.
//  Copyright © 2020 Girish. All rights reserved.
//

    



    import Foundation
    import UIKit

    struct Category {
        var kpiName: String?
        var actualValue : Int?
        var targetValue : Int?
        var KpiStatus : Int?
    }

    class KPIPopupView: UIView , UITableViewDelegate , UITableViewDataSource {
        let cellId = "cellId"
        var kpipopuparray = [KPIValues]()
        var currentstatus : String?
        var currentcategory : String?
        override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.clear
        self.clipsToBounds=true
        self.layer.masksToBounds=true
        
        setupViews()
        
    }

        func setData(popuparray : [KPIValues] , status : String , category : String) {
           self.kpipopuparray = popuparray
            self.currentstatus = status
            self.currentcategory = category
            self.setColors()
            self.table.reloadData()
    
        }
        
        func setColors()  {
            if currentstatus == "ontarget"
            {
                if DataManager.datamanager.darkmode! {
                self.leftview.backgroundColor = UIColor(red:64/255, green:136/255, blue:80/255, alpha: 1)
                }
                else{
                    self.leftview.backgroundColor = UIColor.init(hexString:"#2b9e94" )
                }
            }
            if currentstatus == "offtarget"
            {
                if DataManager.datamanager.darkmode! {
                self.leftview.backgroundColor = UIColor(red:227/255, green:83/255, blue:86/255, alpha: 1)
                }
                else{
                    self.leftview.backgroundColor = UIColor.init(hexString:"#6aa5c4" )
                }
            }
            if currentstatus == "vulnerable"
            {
                if DataManager.datamanager.darkmode! {
                 self.leftview.backgroundColor = UIColor(red:218/255, green:160/255, blue:58/255, alpha: 1)
                }
                else {
                     self.leftview.backgroundColor = UIColor.init(hexString:"#c086d1" )
                }
            }
            
        }

    @objc func close()  {
        self.kpipopuparray.removeAll()
        self.removeFromSuperview()
    }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.kpipopuparray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PopupCell
            cell.updateCellContentt(kpiPopupElement: self.kpipopuparray[indexPath.row], currentstatus: currentstatus!, currentcategory: currentcategory! )
            return cell
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 90
        }

    func setupViews() {
        
        addSubview(containerView)
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
        containerView.backgroundColor = UIColor.clear
        
        containerView.addSubview(table)
        table.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 30).isActive=true
        table.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30).isActive=true
        table.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 10).isActive=true
        table.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive=true
        table.dataSource = self
        table.delegate = self
        table.register(PopupCell.self, forCellReuseIdentifier: cellId)
        
        
        
        containerView.addSubview(leftview)
        leftview.anchor(top: containerView.topAnchor, left: containerView.leftAnchor , bottom: containerView.bottomAnchor, right: nil, paddingTop: 30, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 10, height: 0, enableInsets: true)
       // self.setColors()
        containerView.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: table.topAnchor, constant: 20).isActive=true
        imgView.leftAnchor.constraint(equalTo: table.leftAnchor, constant: -30).isActive=true
        imgView.heightAnchor.constraint(equalToConstant: 70).isActive=true
        imgView.widthAnchor.constraint(equalToConstant: 70).isActive=true
        imgView.makeRounded()
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
    

protocol NotificationProtocalDrilldown {
    func NotifyKPIDrilldown (str : String)
   // func updateError()
    
    
}

    class PopupCell: UITableViewCell {

        var delegatepopup : NotificationProtocalDrilldown?
        let CalenderimgView: UIImageView = {
            let v=UIImageView()
            v.image=#imageLiteral(resourceName: "calendar")
            v.translatesAutoresizingMaskIntoConstraints=false
            return v
        }()
        
    let containerView: UIView = {
        let v=UIView()
        v.backgroundColor = UIColor.white
        v.translatesAutoresizingMaskIntoConstraints=false
        v.layer.cornerRadius = 0.25
        return v
    }()


    private let KPILabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor.clear
        return lbl
    }()
        
        
        private let KPILabelButton : UIButton = {
            let lblbtn = UIButton()
            lblbtn.titleLabel?.textColor = UIColor.black
            lblbtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            lblbtn.titleLabel?.textAlignment = .left
            lblbtn.backgroundColor = UIColor.white
            lblbtn.setTitleColor(UIColor.black, for: .normal)
            return lblbtn
            }()
        
        
        
    private let KPIDate : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textAlignment = .center
        lbl.text = "22"
        lbl.backgroundColor = UIColor.clear
        return lbl
        
    }()

    private let KPITargetLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.layer.cornerRadius = 5
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .center
        lbl.layer.backgroundColor = UIColor(red: 43/255, green: 194/255, blue: 198/255, alpha: 1.0).cgColor
        return lbl
    }()
    private let KPIActualLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
       
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        lbl.textAlignment = .center
        lbl.layer.backgroundColor = UIColor(red: 18/255, green: 133/255, blue: 75/255, alpha: 1.0).cgColor
         lbl.layer.cornerRadius = 5
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
        containerView.addSubview(KPILabelButton)
        containerView.addSubview(KPIDate)
        containerView.addSubview(CalenderimgView)
        containerView.addSubview(KPITargetLabel)
        containerView.addSubview(KPIActualLabel)
        updateUII()
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

        func updateCellContentt(kpiPopupElement : KPIValues , currentstatus : String , currentcategory : String)
    {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSize = 3
        numberFormatter.secondaryGroupingSize = 2
        var formattedactual = numberFormatter.string(from: kpiPopupElement.actual as! NSNumber)
        var formatedTarget = numberFormatter.string(from: kpiPopupElement.target as! NSNumber)
        
        print("the formatted num is \(formattedactual)")
       
        let targetAttributedText  = NSMutableAttributedString(string: "T.  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)])
//        targetAttributedText.append(NSAttributedString(string: String(kpiPopupElement.target!)  , attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.white]))
        targetAttributedText.append(NSAttributedString(string: formatedTarget!  , attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.white]))
        KPITargetLabel.attributedText = targetAttributedText
       // KPITargetLabel.text = a + String(kpiPopupElement.target!)
        let date = kpiPopupElement.kpiDate
        let items = date!.components(separatedBy: " ")
        //KPIDate.text = kpiPopupElement.kpiDate
        KPIDate.text = items[0]
        
        let actualAttributedText  = NSMutableAttributedString(string: "A.  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)])
//        actualAttributedText.append(NSAttributedString(string: String(kpiPopupElement.actual!)  , attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.white]))
        actualAttributedText.append(NSAttributedString(string: formattedactual!  , attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.white]))
        KPIActualLabel.attributedText = actualAttributedText
       var kpiidint = kpiPopupElement.kpiid!
        
        
        //KPIActualLabel.text =  "A." + " " + String(kpiPopupElement.actual!)
        KPILabelButton.accessibilityLabel = currentcategory + "*" + kpiPopupElement.kpiName!  + "*" + String(kpiidint)
        KPILabelButton.setTitle(kpiPopupElement.kpiName!, for: .normal)
        KPILabelButton.addTarget(self, action: #selector(self.pressed), for: .touchUpInside)
        
        if currentstatus == "ontarget"
        {
            if DataManager.datamanager.darkmode! {
            self.KPIActualLabel.backgroundColor = UIColor(red:64/255, green:136/255, blue:80/255, alpha: 1)
            }
            else{
                self.KPIActualLabel.backgroundColor = UIColor.init(hexString: "#2b9e94")
            }
        }
        if currentstatus == "offtarget"
        {
           if DataManager.datamanager.darkmode! {
            self.KPIActualLabel.backgroundColor = UIColor(red:227/255, green:83/255, blue:86/255, alpha: 1)
            }
            else
            {
                self.KPIActualLabel.backgroundColor = UIColor.init(hexString: "#6aa5c4")
            }
        }
        if currentstatus == "vulnerable"
        {
            if DataManager.datamanager.darkmode!
            {
             self.KPIActualLabel.backgroundColor = UIColor(red:218/255, green:160/255, blue:58/255, alpha: 1)
            }
            else{
                 self.KPIActualLabel.backgroundColor = UIColor.init(hexString: "#c086d1")
            }
        }
    }

        @objc func pressed(_ sender: UIButton)  {
            var DataDict:[String: String] = ["data" : sender.accessibilityLabel!]
          var btn = sender
            let nc = NotificationCenter.default
            nc.post(name: Notification.Name("UserLoggedIn"), object: nil, userInfo: DataDict)
             self.delegatepopup?.NotifyKPIDrilldown(str: "abc")
            print("Button is pressed , accessibilityLabel value  is \(btn.accessibilityLabel)")
        }


    func updateUII(){
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: self.frame.width, height: self.frame.height, enableInsets: true)
        
        KPILabelButton.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 20, width: 170, height: 30, enableInsets: true)
        
        KPITargetLabel.anchor(top: containerView.topAnchor, left: KPILabelButton.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 140, height: 30, enableInsets: true)
        
        CalenderimgView.anchor(top: KPILabelButton.bottomAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 37, paddingBottom: 10, paddingRight: 0, width: 25, height: 25, enableInsets: true)
        
        KPIDate.anchor(top: KPILabelButton.bottomAnchor, left: CalenderimgView.leftAnchor, bottom: containerView.bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 20, width: 133, height: 40, enableInsets: true)
        
        KPIActualLabel.anchor(top: KPITargetLabel.bottomAnchor, left: KPIDate.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 140, height: 30, enableInsets: true)
        KPIActualLabel.layer.cornerRadius = 5
        KPIActualLabel.clipsToBounds = true
        }

    }


extension UIImageView {

    func makeRounded() {

        self.layer.borderWidth = 0
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 70 / 2
        self.clipsToBounds = true
        self.contentMode = UIView.ContentMode.scaleAspectFill
    }
}


