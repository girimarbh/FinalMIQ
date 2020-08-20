//
//  AccountSettingsViewController.swift
//  MIQAnalytics
//
//  Created by Girish on 21/07/20.
//  Copyright © 2020 Girish. All rights reserved.
//

import UIKit
import WebKit

class AccountSettingsViewController: UIViewController {
    var properties = [String]()
    var values = [Double]()
    var passdata : String?

    private let myArray: NSArray = ["First","Second","Third"]
    private var myTableView: UITableView!
    
    
//    var headerView: DashboardHeaderView = {
//        let v = DashboardHeaderView()
//
//        return v
//    }()
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
      //  webView.uiDelegate = self as! WKUIDelegate
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    let closeButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
         btn.backgroundColor = UIColor.black
        btn.setTitle("Close", for: .normal)
        btn.titleLabel?.textColor = UIColor.green
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo", size: 14)!
        //btn.titleLabel?.textAlignment = .left
        btn.contentHorizontalAlignment = .left
        btn.setTitleColor(.green, for: .normal)
        btn.addTarget(self, action: #selector(handleClose(_:)), for: .touchUpInside)
        return btn
        
    }()

    @objc func handleClose(_ sender: AnyObject) {

           self.dismiss(animated: true, completion: nil)
       }
       
    override func viewDidLoad() {
        super.viewDidLoad()
        properties = ["","",""]
               values = [1000.0,2000.0,3000.0]

        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

       setupUI()
       // let myURL = URL(string: "https://www.apple.com")
      //let myURL = URL(string: "https://miqdemoui.azurewebsites.net/view/home.html?&PlantID=CALIFORNIA#!/sales")
       let myURL = URL(string:"https://mpduitest.azurewebsites.net/admin.html?&PlantID=ABERDEEN")
       let myRequest = URLRequest(url: myURL!)
       webView.load(myRequest)
        
    }
    
    func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(closeButton)
        self.view.addSubview(webView)
        
        
        closeButton.anchor(top: self.view.topAnchor, left: nil, bottom: nil, right: self.view.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 40, height: 30, enableInsets: false)
        
        webView.anchor(top: self.closeButton.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 500, height: 500, enableInsets: false)
    }
     
}
