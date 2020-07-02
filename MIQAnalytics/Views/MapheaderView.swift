//
//  MapheaderView.swift
//  MIQAnalytics
//
//  Created by Girish on 07/05/20.
//  Copyright © 2020 Girish. All rights reserved.
//

import UIKit

protocol NotificationSettingbtn {
 func Notifysetting()
// func updateError()
 
}



class MapheaderView: UIView {
    var delegate : NotificationSettingbtn?
   
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.clear
        self.clipsToBounds=true
        self.layer.masksToBounds=true
        setupViews()
    }
    
    func setData(title: String, img: UIImage, price: String) {
        lblTitle.text = title + ",  " + price
        imgView.image = img
        lblPrice.text = price
    }
    
    func setupViews() {
        addSubview(containerView)
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
        containerView.backgroundColor = UIColor.white
        containerView.alpha = 1
        
        containerView.isOpaque = true
        
        containerView.addSubview(img)
        img.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 200, enableInsets: true)
        img.contentMode = .scaleAspectFit
//        img.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 2).isActive=true
//        img.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2).isActive=true
//        img.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 2).isActive=true
//        img.heightAnchor.constraint(equalToConstant: 40).isActive=true
//        img.widthAnchor.constraint(equalToConstant: 40).isActive=true
//        img.contentMode = .scaleAspectFill
//        img.backgroundColor = UIColor.black
        
//        plantTypeView1.blink2()
//        containerView.addSubview(plantTypeView1)
//        plantTypeView1.leftAnchor.constraint(equalTo: img.rightAnchor, constant: 100).isActive=true
//        plantTypeView1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 3).isActive=true
//        plantTypeView1.widthAnchor.constraint(equalToConstant: 10).isActive=true
//        plantTypeView1.heightAnchor.constraint(equalToConstant: 10).isActive=true
//        plantTypeView1.makeRounded2()
//        
//        containerView.addSubview(plantTypeView1lbl)
//        plantTypeView1lbl.leftAnchor.constraint(equalTo: plantTypeView1.rightAnchor, constant: 10).isActive=true
//        plantTypeView1lbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive=true
//        plantTypeView1lbl.widthAnchor.constraint(equalToConstant: 70).isActive=true
//        plantTypeView1lbl.heightAnchor.constraint(equalToConstant: 20).isActive=true
//        
//        containerView.addSubview(plantTypeView2)
//        plantTypeView2.leftAnchor.constraint(equalTo: img.rightAnchor, constant: 100).isActive=true
//        plantTypeView2.topAnchor.constraint(equalTo: plantTypeView1.bottomAnchor, constant: 10).isActive=true
//        // plantTypeView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive=true
//        plantTypeView2.widthAnchor.constraint(equalToConstant: 10).isActive=true
//        plantTypeView2.heightAnchor.constraint(equalToConstant: 10).isActive=true
//        plantTypeView2.makeRounded2()
//        
//        containerView.addSubview(plantTypeView2lbl)
//        plantTypeView2lbl.leftAnchor.constraint(equalTo: plantTypeView2.rightAnchor, constant: 10).isActive=true
//        plantTypeView2lbl.topAnchor.constraint(equalTo: plantTypeView1lbl.bottomAnchor, constant: 0).isActive=true
//        plantTypeView2lbl.widthAnchor.constraint(equalToConstant: 80).isActive=true
//        plantTypeView2lbl.heightAnchor.constraint(equalToConstant: 20).isActive=true
//        
//        containerView.addSubview(plantTypeView3)
//        plantTypeView3.leftAnchor.constraint(equalTo: img.rightAnchor, constant: 100).isActive=true
//        plantTypeView3.topAnchor.constraint(equalTo: plantTypeView2.bottomAnchor, constant: 10).isActive=true
//        // plantTypeView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive=true
//        plantTypeView3.widthAnchor.constraint(equalToConstant: 10).isActive=true
//        plantTypeView3.heightAnchor.constraint(equalToConstant: 10).isActive=true
//        plantTypeView3.makeRounded2()
//        
//        
//        containerView.addSubview(plantTypeView3lbl)
//        plantTypeView3lbl.leftAnchor.constraint(equalTo: plantTypeView3.rightAnchor, constant: 10).isActive=true
//        plantTypeView3lbl.topAnchor.constraint(equalTo: plantTypeView2lbl.bottomAnchor, constant: 0).isActive=true
//        plantTypeView3lbl.widthAnchor.constraint(equalToConstant: 170).isActive=true
//        plantTypeView3lbl.heightAnchor.constraint(equalToConstant: 20).isActive=true
        
        containerView.addSubview(settingsbutton)
        
//   containerView.addSubview(switchbtn)
//    switchbtn.anchor(top: containerView.topAnchor, left: img.rightAnchor, bottom: containerView.bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 3, paddingBottom: 3, paddingRight: 0, width: 50, height: 20, enableInsets: true)
//        
       // maptype.addTarget(self, action: #selector(buttonPressmap(button:)), for: .touchUpInside)
        settingsbutton.anchor(top: containerView.topAnchor, left: nil, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 15, paddingRight: 4, width: 25, height: 25, enableInsets: true)
         settingsbutton.addTarget(self, action: #selector(add), for: .touchUpInside)
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
    
    let maptype: UIButton = {
        let btn = UIButton()
         //btn.titleLabel?.text = "locate Plant"
         btn.backgroundColor = UIColor.white
        btn.setTitleColor(.green, for: .normal)
        // btn.setTitle(" locate Plant ", for: .normal)
         btn.setImage(UIImage(named: "blacknoti"), for: .normal)
        return btn
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
    let plantTypeView1: UIView = {
        let v=UIView()
        v.backgroundColor = UIColor.orange
        v.translatesAutoresizingMaskIntoConstraints=false
        v.layer.borderWidth  = 2.0
        v.layer.cornerRadius = 0.25
        v.blink2()
        return v
    }()
    let plantTypeView1lbl: UILabel = {
        let lbl=UILabel()
        lbl.text = "Factory"
        lbl.font=UIFont.boldSystemFont(ofSize: 10)
        lbl.textColor = UIColor.green
        lbl.backgroundColor = UIColor.clear
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    let plantTypeView2: UIView = {
        let v=UIView()
        v.backgroundColor = UIColor.blue
        v.translatesAutoresizingMaskIntoConstraints=false
        v.layer.borderWidth  = 2.0
        v.layer.cornerRadius = 0.25
        v.blink()
        return v
    }()
    let plantTypeView2lbl: UILabel = {
        let lbl=UILabel()
        lbl.text = "Warehouse"
        lbl.font=UIFont.boldSystemFont(ofSize: 10)
        lbl.textColor = UIColor.green
        lbl.backgroundColor = UIColor.clear
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    let plantTypeView3: UIView = {
        let v=UIView()
        v.backgroundColor = UIColor.yellow
        v.translatesAutoresizingMaskIntoConstraints=false
        v.layer.borderWidth  = 2.0
        v.layer.cornerRadius = 0.25
        v.blink()
        return v
    }()
    let plantTypeView4: UIView = {
        let v=UIView()
        v.backgroundColor = UIColor.yellow
        v.translatesAutoresizingMaskIntoConstraints=false
        v.layer.borderWidth  = 2.0
        v.layer.cornerRadius = 0.25
        
        //        var path : String = Bundle.main.path(forResource: "logos", ofType: "svg") ?? "a"
        //       // var path: String = Bundle.mainBundle.path(forResource: "nameOfFile", ofType: "svg")!
        //        var url: NSURL = NSURL.fileURL(withPath: path) as NSURL //Creating a URL which points towards our path
        //
        //              //Creating a page request which will load our URL (Which points to our path)
        //        var request: NSURLRequest = NSURLRequest(url: url as URL)
        //        v.loadRequest(request as URLRequest)
        v.blink()
        return v
    }()
    let plantTypeView3lbl: UILabel = {
        let lbl=UILabel()
        lbl.text = "Regional distribution centre"
        lbl.font=UIFont.boldSystemFont(ofSize: 10)
        lbl.textColor = UIColor.green
        lbl.backgroundColor = UIColor.clear
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    let img: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints=false
        var image: UIImage = UIImage(named: "imagewipro")!
        img = UIImageView(image: image)
//        img.contentMode = .scaleAspectFill
        return img
    }()
    
    
    let settingsbutton: UIButton = {
        let btn = UIButton()
        //btn.titleLabel?.text = "locate Plant"
        btn.backgroundColor = UIColor.white
       btn.setTitleColor(.black, for: .normal)
       // btn.setTitle(" locate Plant ", for: .normal)
        btn.setImage(UIImage(named: "bar2"), for: .normal)
      
     
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
    
    
    let switchbtn : UISwitch = {
        let switchbtn = UISwitch()
       // switchbtn.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
        switchbtn.setOn(true, animated: false)
      return switchbtn
        
    }()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func add()  {
        delegate?.Notifysetting()
    }
    
    @objc func buttonPressmap(button:UIButton) {
        //mapdelegate?.Notifymap()
       }
    
    
}
extension UIView {
    
    func makeRounded2() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10 / 2
        self.clipsToBounds = true
        self.contentMode = UIView.ContentMode.scaleAspectFill
    }
}
extension UIView {
    func blink2(duration: Double=0.5, repeatCount: Int=100000) {
        self.alpha = 0.0;
        UIView.animate(withDuration: duration,
            delay: 0.0,
            options: [.curveEaseInOut, .autoreverse, .repeat],
            animations: { [weak self] in
                UIView.setAnimationRepeatCount(Float(repeatCount) + 0.5)
                self?.alpha = 1.0
            }
        )
    }
}