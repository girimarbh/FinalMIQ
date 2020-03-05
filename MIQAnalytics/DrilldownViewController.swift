//
//  DrilldownViewController.swift
//  MIQAnalytics
//
//  Created by Girish on 12/02/20.
//  Copyright © 2020 Girish. All rights reserved.
//

import UIKit

class DrilldownViewController: UIViewController , UITableViewDelegate, UITableViewDataSource , DrilldownDelegate , NotificationProtocaldrill , NotificationSelect{
    func managementoperationSelected(str: Int) {
        drildownviewModel.managementviewfetchdata(id: 3, Kpiid: passedkpiid!, plantid: passedPlantID!)
    }
    
    func NotifySelect(str: Int) {
        drildownviewModel.drilldownKPIarraynew.removeAll()
        drildownviewModel.fetchdata(id: str ,  Kpiid: passedkpiid! , plantid: passedPlantID!)
        self.Selecteditem = str
       // myTableView.reloadData()
    
        self.showActivityIndicator()
    }
    
    func updateContentOnViewdrillcontroller() {
        DispatchQueue.main.async{ [weak self] in
            guard let weakSelf = self else { return }
            // and then dismiss the control
            self?.hideActivityIndicator()
            self!.drilldowncontrollerKPIarray = self!.drildownviewModel.drilldownKPIarraynew
            self?.myTableView.isHidden = false
            self?.myTableView.dataSource = self
            self?.myTableView.delegate = self
            self?.myTableView.reloadData()
           
//            self?.myTableView.register(KPIBarChartCell.self, forCellReuseIdentifier: self!.cellId2)

        }
    }
    
    func didPressButton(button: UIButton) {
        print("didPressButton is called in drilldown")
        self.dismiss(animated: true, completion: nil)
    }
    var drilldowncontrollerKPIarray = [KPIValuesdrilldownnew]()
    var properties = [String]()
    var values = [Double]()
    var passdata : String?
    var passdataCategory : String?
    var passdataKPI : String?
    var passedkpiid : Int?
    var passedPlantID : String?
    

    private let myArray: NSArray = ["First","Second","Third"]
    private var myTableView: UITableView!
    let cellId = "cellId"
     let cellId2 = "cellId2"
    let cellId3 = "cellId3"
    let cellID4 = "cellID4"
    var activityView: UIActivityIndicatorView?
     var drildownviewModel = DrildownViewModel()
    var Selecteditem : Int?
    
    var headerView: DrilldownheaderView = {
        let v = DrilldownheaderView()
     
        return v
    }()
    

    override func viewDidLoad() {
        DataManager.datamanager.selectbtn = 1
        self.Selecteditem = 1
         if ReachabilityTest.isConnectedToNetwork() {
        drildownviewModel.fetchdata(id: 1 ,  Kpiid: passedkpiid! , plantid: passedPlantID!)
            
             drildownviewModel.delegate = self as? NotificationProtocaldrill
            self.showActivityIndicator()
        }
//        drildownviewModel.delegate = self as? NotificationProtocaldrill
        drildownviewModel.getParticularCategory(category: passdataCategory!)
        print("thae drildownview category maodel values is ,\(drildownviewModel.drilldowncategory) ")
        drildownviewModel.getKPIValues(kpiname: passdataKPI!)
        print("thae drildownview kpi maodel values is ,\(drildownviewModel.drilldownKPI) ")
        var a = drildownviewModel.getkpiarr(category: passdataCategory!)
        print("drilldownviewmode kpiarray is \(drildownviewModel.drilldownkpiarray)")
        super.viewDidLoad()
        properties = ["","",""]
               values = [1000.0,2000.0,3000.0]

        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        headerView  = DrilldownheaderView(frame: CGRect(x: 0.0, y: barHeight, width: self.view.frame.size.width, height: 50 ))
        headerView.delegate = self
        self.view.addSubview(headerView)
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight + 60 , width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(KPIChartCell.self, forCellReuseIdentifier: cellId)
        myTableView.register(KPIBarChartCell.self, forCellReuseIdentifier: cellId2)
         //myTableView.register(OperationCell.self, forCellReuseIdentifier: cellId3)
       // myTableView.register(KPIStstusCell.self, forCellReuseIdentifier: cellId3)
        myTableView.isHidden = true
//        myTableView.dataSource = self
//        myTableView.delegate = self
//        myTableView.showsVerticalScrollIndicator = false
        
        self.view.addSubview(myTableView)
         
        
    }
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return headerView
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        if indexPath.row == 0 {
                   let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! KPIChartCell
                           cell.properties = ["United States","Mexico","Canada","Chile"]
                           cell.values = [1000.0,2000.0,3000.0,4000.0]
                  // cell.updateCellContentt(property:properties , value: values)
            cell.updateCellContenttt(categoryhealth: drildownviewModel.drilldowncategory!)
                           return cell
               }
            
            if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellId2, for: indexPath) as! KPIBarChartCell
                cell.properties = ["United States","Mexico","Canada","Chile"]
                cell.values = [1000.0,2000.0,3000.0,4000.0]
                cell.selecteditem =  self.Selecteditem
                cell.updateCellContentt(kpivalues: drildownviewModel.drilldownKPI!, category: drildownviewModel.drilldowncategory!, KPIValuesdrilldownnew : drilldowncontrollerKPIarray)
                cell.delegate = self as! NotificationSelect
                //cell.updateCellContentt(property:properties , value: values)
                        return cell
            }
//               else   {
//                   let cell = tableView.dequeueReusableCell(withIdentifier: cellId3, for: indexPath) as! KPIStstusCell
//                           cell.properties = ["United States","Mexico","Canada","Chile"]
//                           cell.values = [1000.0,2000.0,3000.0,4000.0]
//                   cell.updateCellContentt(property:properties , value: values)
//                           return cell
//               }
//
                 let cell = tableView.dequeueReusableCell(withIdentifier: cellId3, for: indexPath) as! KPIBarChartCell
                cell.properties = ["United States","Mexico","Canada","Chile"]
                cell.values = [1000.0,2000.0,3000.0,4000.0]
       // cell.updateCellContentt(property:properties , value: values)
                return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Num: \(indexPath.row)")
//        print("Value: \(myArray[indexPath.row])")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
        
        
    }
    
   
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
      return  400
    }
            if indexPath.row == 1 {
              return  1300
            }
        else{
        
         return   800
        }
    
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
}
