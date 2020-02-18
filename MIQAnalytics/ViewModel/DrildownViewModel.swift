//
//  DrildownViewModel.swift
//  MIQAnalytics
//
//  Created by Girish on 12/02/20.
//  Copyright © 2020 Girish. All rights reserved.
//

import UIKit

class DrildownViewModel: NSObject {
    
    var drilldownarrcategoryhealth = [CategoryHealth]()
    var drilldowncategory : CategoryHealth?
    var drilldownKPI : KPIValues?
    
    
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
}
