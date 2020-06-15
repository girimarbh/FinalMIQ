//
//  DataManager.swift
//  MIQAnalytics
//
//  Created by Girish on 12/02/20.
//  Copyright © 2020 Girish. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    var kpiarray = [KPI]()
    var health : Health?
    var categoryhealth : CategoryHealth?
    var arrcategoryhealth = [CategoryHealth]()
    var arrcatagory = [String]()
    var kpivalues = [KPIValues]()
    
    static public let datamanager = DataManager()
    var selectbtn : Int?
    var operationSelected : Int?
    var darkmode : Bool?
    
    public override init() {
        

    }

}
