//
//  DrildownViewModel.swift
//  MIQAnalytics
//
//  Created by Girish on 12/02/20.
//  Copyright © 2020 Girish. All rights reserved.
//

import UIKit

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
    
    var drilldownarrcategoryhealth = [CategoryHealth]()
    var drilldowncategory : CategoryHealth?
    var drilldownKPI : KPIValues?
    var drilldownkpiarray = [KPIValuesdrilldown]()
    
    
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
                   drilldownKPI = KPIValues.init(with: arr.actual, target: arr.target, kpiName: arr.kpi, kpidate: arr.actualdate)
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
}
