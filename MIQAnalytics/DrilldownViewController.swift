//
//  DrilldownViewController.swift
//  MIQAnalytics
//
//  Created by Girish on 12/02/20.
//  Copyright © 2020 Girish. All rights reserved.
//

import UIKit

class DrilldownViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    var properties = [String]()
    var values = [Double]()
    var passdata : String?
    var passdataCategory : String?
    var passdataKPI : String?
    

    private let myArray: NSArray = ["First","Second","Third"]
    private var myTableView: UITableView!
    let cellId = "cellId"
     let cellId2 = "cellId2"
    let cellId3 = "cellId3"
    let cellID4 = "cellID4"
    
     var drildownviewModel = DrildownViewModel()
    
    var headerView: DashboardHeaderView = {
        let v = DashboardHeaderView()
     
        return v
    }()
    

    override func viewDidLoad() {
        drildownviewModel.getParticularCategory(category: passdataCategory!)
        print("thae drildownview category maodel values is ,\(drildownviewModel.drilldowncategory) ")
        drildownviewModel.getKPIValues(kpiname: passdataKPI!)
        print("thae drildownview kpi maodel values is ,\(drildownviewModel.drilldownKPI) ")
        super.viewDidLoad()
        properties = ["","",""]
               values = [1000.0,2000.0,3000.0]

        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight , width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(KPIChartCell.self, forCellReuseIdentifier: cellId)
        myTableView.register(KPIBarChartCell.self, forCellReuseIdentifier: cellId2)
         //myTableView.register(OperationCell.self, forCellReuseIdentifier: cellId3)
       // myTableView.register(KPIStstusCell.self, forCellReuseIdentifier: cellId3)
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.showsVerticalScrollIndicator = false
        
        self.view.addSubview(myTableView)
         headerView  = DashboardHeaderView(frame: CGRect(x: 0.0, y: 0.0, width: 200, height: 50 ))
        
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
                cell.updateCellContentt(kpivalues: drildownviewModel.drilldownKPI!, category: drildownviewModel.drilldowncategory!)
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
}
