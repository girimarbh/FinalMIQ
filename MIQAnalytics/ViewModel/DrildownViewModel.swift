//
//  DrildownViewModel.swift
//  MIQAnalytics
//
//  Created by Girish on 12/02/20.
//  Copyright © 2020 Girish. All rights reserved.
//

import UIKit

protocol NotificationProtocaldrill {
    func updateContentOnViewdrillcontroller()
   // func updateError()
    
    
}

struct KPIValuesdrilldownnew {
    var actual : Float?
    var target : Float?
    var kpiDate : String?
    var status : Int?
   
    
    init?(with actual:Float?, target:Float?,  kpidate : String? , kpistatus : Int?) {
        self.actual = actual
        self.target = target
        self.kpiDate = kpidate
        self.status = kpistatus

       }
}


struct KPIValuesdrilldown {
    var actual : Float?
    var target : Float?
    var kpiName : String?
     var kpiDate : String?
    var status : Int?
   
    
    init?(with actual:Float?, target:Float?,kpiName : String? , kpidate : String? , kpistatus : Int?) {
        self.actual = actual
        self.target = target
        self.kpiName = kpiName
        self.kpiDate = kpidate
        self.status = kpistatus

       }
}

class DrildownViewModel: NSObject {
    var delegate : NotificationProtocaldrill?
    var drilldownarrcategoryhealth = [CategoryHealth]()
    var drilldowncategory : CategoryHealth?
    var drilldownKPI : KPIValues?
    var drilldownkpiarray = [KPIValuesdrilldown]()
    var drilldownKPIarraynew = [KPIValuesdrilldownnew]()
    
    
//    func getParticularCategory(category : String) -> CategoryHealth   {
//        for kpiarr in DataManager.datamanager.arrcategoryhealth
//        {
//            if kpiarr.categoryName == category || kpiarr.categoryName!.caseInsensitiveCompare(category) == .orderedSame
//            {
//                drilldowncategory = CategoryHealth.init(with: kpiarr.onTarget, vulenrable: kpiarr.vulenrable, offTarget: kpiarr.offTarget, kpiTotalCount: kpiarr.kpiTotalCount, categoryName: kpiarr.categoryName, categoryid: kpiarr.categoryID)
//            }
//        }
//        return drilldowncategory!
//    }
    
    func getParticularCategory(category : String)   {
        for kpiarr in DataManager.datamanager.arrcategoryhealth
        {
            if kpiarr.categoryName == category || kpiarr.categoryName!.caseInsensitiveCompare(category) == .orderedSame
            {
                drilldowncategory = CategoryHealth.init(with: kpiarr.onTarget, vulenrable: kpiarr.vulenrable, offTarget: kpiarr.offTarget, kpiTotalCount: kpiarr.kpiTotalCount, categoryName: kpiarr.categoryName, categoryid: kpiarr.categoryID)
            }
        }
        
    }
    
    
//    func getKPIValues(kpiname : String) -> KPIValues {
//
//        for arr in DataManager.datamanager.kpiarray
//        {
//            if arr.kpi == kpiname
//            {
//                drilldownKPI = KPIValues.init(with: arr.actual, target: arr.target, kpiName: arr.kpi, kpidate: arr.actualdate)
//            }
//        }
//        return drilldownKPI!
//    }

   
    func getKPIValues(kpiname : String)  {
           
           for arr in DataManager.datamanager.kpiarray
           {
               if arr.kpi == kpiname
               {
                drilldownKPI = KPIValues.init(with: arr.actual, target: arr.target, kpiName: arr.kpi, kpidate: arr.actualdate, kpiid: arr.kpiID)
               }
           }
           
       }
    
    func getkpiarr(category : String) ->  [KPIValuesdrilldown]? {
                                var ontargetcount : Int = 0
                                var offtargetcount : Int = 0
                                var vulenrabletargetcount: Int = 0
                                var kpiTotalCount : Int = 0
                                var categoryname = String()
                                var kpipopuparray = [KPIValuesdrilldown]()
               
               var status : Int?
              // let items = category.components(separatedBy: " ")
              // categoryname = items[0]
              // var statusstring = items[1]
               
//               if statusstring == "ontarget"
//               {
//                   status = 1
//               }
//               if statusstring == "vulnerable"
//                          {
//                              status = 0
//                          }
//               if statusstring == "offtarget"
//                          {
//                              status = -1
//                          }
               
               for peopleDict in DataManager.datamanager.kpiarray
                                {  // categoryname = category
                                 
                                  if  peopleDict.category!.caseInsensitiveCompare(category) == .orderedSame
                                               {
                                                kpipopuparray.append(KPIValuesdrilldown(with: peopleDict.actual, target: peopleDict.target, kpiName: peopleDict.kpi ,kpidate: peopleDict.actualdate ,kpistatus: peopleDict.status)!)
                                                
                                              
                                                
                                                
                                               }
                             }
                                drilldownkpiarray = kpipopuparray
        
                             return kpipopuparray
                             
                            }
    
    
    func fetchdata(id : Int , Kpiid : Int  , plantid : String)  {
    DrillNewtworkManager.networkmanager.retrieveAPIData(id : id , plantid : plantid , Kpiid : Kpiid, userCompletionHandler: { [weak self] data , error in
            guard let weakSelf = self else {
                return
            }
            guard error == nil else {
                print(error!)
                //self?.delegate?.updateError()
                return
            }
            guard let json = data else {
                print("No data")
                return
            }
            do {
                let array =  try JSONSerialization.jsonObject(with: json as Data, options: []) as? [Any]
                print("json array in drilldown nm \(String(describing: array))")
                if self!.drilldownKPIarraynew.count > 1 {
                self?.drilldownKPIarraynew.removeAll()
                }
                for peopleDict in array!
                {
//                    ACTUAL = "3.5";
//                    "ACTUAL_DATE" = "1/31/2019 12:00:00 AM";
//                    ANNUAL = "<null>";
//                    FROMDATE = "<null>";
//                    "KPI_TYPE" = M;
//                    MONTHNAME = "<null>";
//                    NO = "<null>";
//                    STATUS = "-1";
//                    TARGET = "2.85";
//                    TODATE = "<null>";
//                    UNIT = "%";
//                    YEAR = "<null>";
                    
                  if let dict = peopleDict as? [String: Any]{
                       let actual = (dict["ACTUAL"] as! NSString).floatValue
                       let actualdate = dict["ACTUAL_DATE"] as! String
                      let status = (dict["STATUS"] as! NSString).intValue
                       let target = (dict["TARGET"] as! NSString).floatValue
                  
//                        let hirarchy = (dict["HIRARCHY"] as? NSString ?? "0").intValue
//                        let latitude = (dict["LATITUDE"] as! NSString).doubleValue
//                        let longitude = (dict["LONGITUDE"] as! NSString).doubleValue
//                        let map = (dict["MAP"] as! NSString).intValue
//                        let plantid = dict["PLANTID"] as! String
//                        self?.placearray.append(Place(code: Int(code), comments: Comments, displayName: displayname, healthperc: Int(healthPrec), hirarchy: Int(hirarchy), latitude: latitude, longitude: longitude, map: Int(map), plantID: plantid))
                    self?.drilldownKPIarraynew.append(KPIValuesdrilldownnew(with: actual, target: target, kpidate: actualdate, kpistatus: Int(status))!)
                      }
                   
                    
                    }
                 print("the new drill down kpi array is new \(self!.drilldownKPIarraynew)")
                
            } catch {
                print(error.localizedDescription)
            }
            //weakSelf.delegate?.updateContentOnView()

            guard json.count != 0 else {
                print("Zero bytes of data")
                return
            }
            weakSelf.delegate?.updateContentOnViewdrillcontroller()
            //  print("string is \(String(decoding: json, as: UTF8.self))")
            // let dict = self.convertToDictionary(text: String(decoding: json, as: UTF8.self))
            //                guard let tittle = list.productTittle else {
            //                    return
            //                }
            
            //                weakSelf.headerTittle = tittle
            //                weakSelf.datalist = list.productlist
            //weakSelf.delegate?.updateContentOnView()
        })
    }
}
