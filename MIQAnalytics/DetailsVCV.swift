
//
//  DetailsVC.swift
//  googlMapTutuorial2
//
//  googlMapTutuorial2
//
//  Created by Girish on 03/01/20.


import UIKit

import UserNotifications


class DetailsVC : UIViewController, UITableViewDelegate, UITableViewDataSource , DashbardNotificationProtocal , StoreDelegate , NotificationProtocalKPIPopup , NotificationProtocalDrilldown , insightdelegate  {
    func didPressnotificationButton(button: UIButton) {
        print("pressed notification button")
        
        notificationinsightview = NotificationvView(frame: CGRect(x: 10.0, y: 200.0, width: 350, height: 300))
        notificationinsightview.setData(popuparray: dashboardviewmodel.insightsarray)
        let blurEffect = UIBlurEffect(style: .regular)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = self.view.bounds
        blurredEffectView.alpha = 0.9
        view.addSubview(blurredEffectView)
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(longLabelPressed2))
               tap1.numberOfTapsRequired = 1
        blurredEffectView.addGestureRecognizer(tap1)
        self.view.addSubview(notificationinsightview)
    }
    
    
    
   
    
    
   
    
    var kpipopuparr = [KPIValues]()
    var count : Double?
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
     let notificationCenter = UNUserNotificationCenter.current()
    
    func NotifyKPIPopup(str: String) {
        print("Notification for KPIPOPup")
       
        kpipopuparr = dashboardviewmodel.getvaluesontouchButtonsnew(category: str) ?? []
         count = Double(kpipopuparr.count)
        
        
        var h = 100.0 * count!
        
        if count == 1
        {
            h = 120
        }
        else{
            h = 100.0 * count!
        }
        let items = str.components(separatedBy: " ")
        var categoryname = items[0]
        var statusstring = items[1]
        kpipopupview = KPIPopupView(frame: CGRect(x: 10.0, y: 200.0, width: 350, height: h))
        print("the Kpi array is \(kpipopuparr)")
        kpipopupview.setData(popuparray: kpipopuparr ,status: statusstring , category : categoryname )
        kpipopuparr.removeAll()
        let blurEffect = UIBlurEffect(style: .regular)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = self.view.bounds
        blurredEffectView.alpha = 0.9
        view.addSubview(blurredEffectView)
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(longLabelPressed))
               tap1.numberOfTapsRequired = 1
        blurredEffectView.addGestureRecognizer(tap1)
        self.view.addSubview(kpipopupview)
        
    }
    
    func NotifyKPIDrilldown(str: String) {
           print("press from popupcell")
       }
       
     @objc func longLabelPressed(recognizer:UITapGestureRecognizer){
        if let view = recognizer.view {
            view.removeFromSuperview()
            kpipopupview.removeFromSuperview()
        }
    }
    
    @objc func longLabelPressed2(recognizer:UITapGestureRecognizer){
        if let view = recognizer.view {
            view.removeFromSuperview()
            notificationinsightview.removeFromSuperview()
        }
    }
    
    func didPressButton(button: UIButton) {
        print("didPressButton is called in detailvc")
        self.dismiss(animated: true, completion: nil)
    }
    
    var properties = [String]()
    var values = [Double]()
    var passdata : String?
    var dashboardviewmodel = DashboardViewModel()
    private let myArray: NSArray = ["First","Second","Third"]
   private var myTableView: UITableView!
    let cellId = "cellId"
     let cellId2 = "cellId2"
    let cellId3 = "cellId3"
     let cellId4 = "cellId4"
var activityView: UIActivityIndicatorView?
    

    var headerView: DashboardHeaderView = {
        let v = DashboardHeaderView()
        v.translatesAutoresizingMaskIntoConstraints=false

        return v
    }()

//    var myTableView : UITableView = {
//        let v = UITableView()
//        return v
//    v.translatesAutoresizingMaskIntoConstraints=false
//    }()


//    override func viewDidAppear(_ animated: Bool) {
//        if ReachabilityTest.isConnectedToNetwork() {
//
//
//                   dashboardviewmodel.fetchData(plantid: passdata!)
//                   self.showActivityIndicator()
//                    dashboardviewmodel.delegate = self as? DashbardNotificationProtocal
//
//                   //Calling Viewmodel class to fetchdata
//               }
//               else{
//
//                   print("internet not there")
//                  let alert = UIAlertController(title: internetConnection, message: noInternetAvailable , preferredStyle: .alert)
//                   alert.addAction(UIAlertAction(title: cancel , style: .cancel, handler: {[weak self] _ in
//                       guard let weakSelf = self else { return }
//
//                   }))
//
//
//
//                   self.present(alert, animated: true, completion: nil)
//
//               }
//
//    }

    override func viewDidLoad() {
        
        
        
        notificationCenter.delegate = self as! UNUserNotificationCenterDelegate
        
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        notificationCenter.requestAuthorization(options: options) {
            (didAllow, error) in
            if !didAllow {
                print("User has declined notifications")
            }
        }
        
       
         let nc = NotificationCenter.default
nc.addObserver(self, selector: #selector(userLoggedIn(_:)), name: Notification.Name("UserLoggedIn"), object: nil)
      super.viewDidLoad()
      var cell = PopupCell()
      cell.delegatepopup = self
        

        if ReachabilityTest.isConnectedToNetwork() {


            dashboardviewmodel.fetchData(plantid: passdata!)
            self.showActivityIndicator()
             dashboardviewmodel.delegate = self as? DashbardNotificationProtocal

            //Calling Viewmodel class to fetchdata
        }
        else{
            
            print("internet not there")
           let alert = UIAlertController(title: internetConnection, message: noInternetAvailable , preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: cancel , style: .cancel, handler: {[weak self] _ in
                guard let weakSelf = self else { return }

            }))
            
            
            
            self.present(alert, animated: true, completion: nil)

        }


        let guide = view.safeAreaLayoutGuide

        properties = ["","",""]
               values = [1000.0,2000.0,3000.0]

        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

       headerView  = DashboardHeaderView(frame: CGRect(x: 0.0, y: barHeight, width: self.view.frame.width, height: 50 ))
        headerView.delegate = self
        headerView.notidelegate = self
//        kpipopupview = KPIPopupView(frame: CGRect(x: 10.0, y: 300.0, width: 350, height: 200 ))
        
        self.view.addSubview(headerView)
//       headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:0).isActive=true
//       headerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive=true
//       headerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive=true
//       headerView.heightAnchor.constraint(equalToConstant: 70).isActive=true

//        self.view.addSubview(myTableView)
//        myTableView.anchor(top: self.view.topAnchor , left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: displayWidth, height:displayHeight, enableInsets: false)
//
        
        //      myTableView.topAnchor.constraint(equalTo: self.view.topAnchor ).isActive=true
//        myTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive=true
//        myTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive=true
//        myTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 60).isActive=true


        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight+60 , width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(PieChartCell.self, forCellReuseIdentifier: cellId)
        myTableView.register(PlantStatusCell.self, forCellReuseIdentifier: cellId2)
        myTableView.register(KPIStstusCell.self, forCellReuseIdentifier: cellId3)
        myTableView.register(PopupCell.self, forCellReuseIdentifier: cellId4)
     //   myTableView.dataSource = self
       // myTableView.delegate = self
        myTableView.showsVerticalScrollIndicator = false
       self.view.addSubview(myTableView)
        self.myTableView.isHidden = true
        self.myTableView.allowsSelection = false
       











    }
    
    @objc func userLoggedIn(_ notification: NSNotification) {
           print(notification.userInfo ?? "")
           if let dict = notification.userInfo as NSDictionary? {
               if let id = dict["data"] as? String{
                print("The string in notification is \(id)")
                let items = id.components(separatedBy: "*")
                var categoryname = items[0]
                var kpistring = items[1]
                var kpiid = items[2]
                let v=DrilldownViewController()
                v.passdataCategory = categoryname
                v.passdataKPI = kpistring
                v.passedkpiid = Int(kpiid)
                v.passedPlantID = passdata
                v.modalPresentationStyle = .fullScreen

                       //v.passdata = mapviewmodel.placearray[tag].comments
                    //print("passed value is \(mapviewmodel.placearray[tag].comments)")
                     self.present(v , animated: true , completion: nil)
                   // do something with your image
               }
           }
    }
    
    @objc func userLoggedIn()  {
        
        let v=DrilldownViewController()
        v.modalPresentationStyle = .fullScreen

               //v.passdata = mapviewmodel.placearray[tag].comments
            //print("passed value is \(mapviewmodel.placearray[tag].comments)")
             self.present(v , animated: true , completion: nil)
        print("jfjhjfh")
    }

    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .whiteLarge)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }
    

    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return headerView
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50.0
//
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//      let cell = tableView.dequeueReusableCell(withIdentifier: cellId4, for: indexPath) as! PopupCell
//         cell.delegatepopup = self

        if indexPath.row == 0 {
                   let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PieChartCell
                           cell.properties = ["United States","Mexico","Canada","Chile"]
                           cell.values = [1000.0,2000.0,3000.0,4000.0]
                //   cell.updateCellContentt(property:properties , value: values
            cell.updateCellContentt(categoryhealth: dashboardviewmodel.health!)
                           return cell
               }

            if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId2, for: indexPath) as! PlantStatusCell
                        cell.properties = ["United States","Mexico","Canada","Chile"]
                        cell.values = [1000.0,2000.0,3000.0,4000.0]
                cell.updateCellContentt(categoryhealth: dashboardviewmodel.health!)
                        return cell
            }
               else   {
                   let cell = tableView.dequeueReusableCell(withIdentifier: cellId3, for: indexPath) as! KPIStstusCell
                           cell.properties = ["United States","Mexico","Canada","Chile"]
                           cell.values = [1000.0,2000.0,3000.0,4000.0]
                cell.delegate = self
                cell.updateCellContentt(categoryhealth: dashboardviewmodel.arrcategoryhealth[indexPath.row - 2] )
                           return cell
               }

               // let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PopupCell
      //  cell.delegatepopup = self
//                cell.properties = ["United States","Mexico","Canada","Chile"]
//                cell.values = [1000.0,2000.0,3000.0,4000.0]
//        cell.updateCellContentt(property:properties , value: values)
//                return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Num: \(indexPath.row)")
//        print("Value: \(myArray[indexPath.row])")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dashboardviewmodel.arrcategoryhealth.count + 2


    }


     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
      return  340
    }
        if indexPath.row == 1{
                return 300
        }
        else{

         return   320
        }

}

    func updateContentOnView(){
        print("Data manager KPI array data is \(DataManager.datamanager.kpiarray)")
        print("Data manager category array data is \(DataManager.datamanager.arrcategoryhealth)")
        
        DispatchQueue.main.async{ [weak self] in
            guard let weakSelf = self else { return }
            // and then dismiss the control
            self?.hideActivityIndicator()
            self?.myTableView.isHidden = false
            self?.myTableView.dataSource = self
            self?.myTableView.delegate = self
            self?.myTableView.reloadData()
            
            
          
        }
        
        self.dashboardviewmodel.fetchInsightsData(plantid: self.passdata!)

    }
    
    func updateContentOnViewforInsights() {
        print("the insight array in dashboard is \(dashboardviewmodel.insightsarray)" )
        
        
               var count = 1
        for  insightarr in dashboardviewmodel.insightsarray
        {
            print("for loop count")
            count = count + 1
//           var header = insightarr.header
//           var insigt = insightarr.insight
            self.scheduleNotification(notificationType: "Local Notification1" , insight: insightarr ,identifier: insightarr.header!, count: count )
            
            
            
        }
        
//               self.scheduleNotification(notificationType: "Local Notification2")
//               self.scheduleNotification(notificationType: "Local Notification3")
//
    }
    
    var kpipopupview: KPIPopupView = {
           let v=KPIPopupView()
        
           return v
       }()
    
    var notificationinsightview : NotificationvView = {
        let v = NotificationvView()
     
        return v
    }()
}
extension DetailsVC: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.notification.request.identifier == "Local Notification" {
            print("Handling notifications with the Local Notification Identifier")
        }
        
        completionHandler()
    }
    
    func scheduleNotification(notificationType: String , insight : Insights , identifier : String , count : Int) {
    print("schedule count")
        let content = UNMutableNotificationContent() // Содержимое уведомления
        let categoryIdentifire = "Delete Notification Type"
        
        content.title = insight.header ?? ""
        content.body = insight.insight ?? ""
        content.sound = UNNotificationSound.default
        content.badge = count as NSNumber
        content.categoryIdentifier = categoryIdentifire
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let identifier = insight.header
        var request = UNNotificationRequest(identifier: identifier!, content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error notification\(error.localizedDescription)")
            }
        }
        
        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "DeleteAction", title: "Delete", options: [.destructive])
        let category = UNNotificationCategory(identifier: categoryIdentifire,
                                              actions: [snoozeAction, deleteAction],
                                              intentIdentifiers: [],
                                              options: [])
        
        notificationCenter.setNotificationCategories([category])
    }
}
