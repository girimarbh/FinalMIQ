//
//  KPIBarChartCell.swift
//  MIQAnalytics
//
//  Created by Girish on 12/02/20.
//  Copyright © 2020 Girish. All rights reserved.
//

import UIKit
import Charts

class KPIBarChartCell: UITableViewCell {

//     var colors = [UIColor.init(hexString: "#138b4a"),UIColor.init(hexString: "#f54450"),UIColor.init(hexString: "#e49e0d")]

let containerView: UIView = {
        let v=UIView()
        let yourColor : UIColor = UIColor(red:223/255, green:220/255, blue:224/255, alpha: 1)
        v.layer.masksToBounds = true
        v.layer.borderColor = yourColor.cgColor
        v.layer.borderWidth = 1.0
        v.backgroundColor = UIColor.white
        v.translatesAutoresizingMaskIntoConstraints=false
        v.layer.borderWidth  = 1.0
        v.layer.cornerRadius = 0.25
       
       
       return v
   }()
    
    let containerview2: UIView = {
        let v=UIView()
        let yourColor : UIColor = UIColor(red:223/255, green:220/255, blue:224/255, alpha: 1)
        v.layer.masksToBounds = true
        v.layer.borderColor = yourColor.cgColor
        v.layer.borderWidth = 1.0
        v.backgroundColor = UIColor(red:223/255, green:220/255, blue:224/255, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints=false
        v.layer.cornerRadius = 0.25
        
        
        return v
    }()
    
    let containerview3: UIView = {
           let v=UIView()
           v.backgroundColor = UIColor.white
           v.translatesAutoresizingMaskIntoConstraints=false
           v.layer.cornerRadius = 0.25
           return v
       }()
       
    
    let barchartcontainerView: UIView = {
        let v=UIView()
        v.backgroundColor = UIColor.black
        v.translatesAutoresizingMaskIntoConstraints=false
        v.layer.cornerRadius = 0.25
        
        
        return v
    }()
    
    public let lastupdatedLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        lbl.font = UIFont.systemFont(ofSize: 8)
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 0.5
        lbl.backgroundColor = UIColor.clear
        lbl.text = "Last updated"
        return lbl
    }()
    public let lastupdatedDateLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.white
        lbl.font = UIFont.systemFont(ofSize: 8)
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 0.5
        lbl.backgroundColor = UIColor.clear
        lbl.text = "8/9/2019"
        return lbl
    }()
    
public let KpiNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red:42/255, green:152/255, blue:181/255, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 24)
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 0.5
        lbl.backgroundColor = UIColor.clear
        lbl.text = "TCIR 12 Rolling Months"
        return lbl
    }()
public let dailyLabelbtn : UIButton = {
    let btn = UIButton()
    btn.setTitle("Daily", for: .normal)
    btn.titleLabel?.textAlignment = .left
    btn.layer.cornerRadius = 0.5
    btn.backgroundColor = UIColor(red:61/255, green:188/255, blue:252/255, alpha: 1)
    
    return btn
}()

public let monthlyLabelbtn : UIButton = {
    let btn = UIButton()
     btn.setTitle("Monthly", for: .normal)
    btn.titleLabel?.textAlignment = .left
    btn.layer.cornerRadius = 0.5
    btn.titleLabel?.textColor = UIColor.white
    btn.backgroundColor = UIColor(red:135/255, green:104/255, blue:166/255, alpha: 1)
    
    return btn
}()
public let weeklyLabelbtn : UIButton = {
    let btn = UIButton()
    btn.setTitle("Weekly", for: .normal)
    btn.titleLabel?.textAlignment = .left
    btn.layer.cornerRadius = 0.5
  
    btn.backgroundColor = UIColor(red:250/255, green:125/255, blue:57/255, alpha: 1)
    
    return btn
}()

public let scnearioDateLabel : UILabel = {
    let lbl = UILabel()
    lbl.textColor = UIColor(red:190/255, green:61/255, blue:135/255, alpha: 1)
    lbl.font = UIFont.systemFont(ofSize: 20)
    lbl.textAlignment = .center
  lbl.layer.borderColor = UIColor.lightGray.cgColor
    lbl.layer.borderWidth = 0.6
    
   // lbl.layer.borderWidth = 0.5
    lbl.layer.addBorder(edge: UIRectEdge.top, color: UIColor.green, thickness: 0.5)
     lbl.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.red, thickness: 0.6)
     lbl.layer.addBorder(edge: UIRectEdge.left, color: UIColor.red, thickness: 0.6)
     lbl.layer.addBorder(edge: UIRectEdge.right, color: UIColor.clear, thickness: 0.6)
    
    
    
    lbl.backgroundColor = UIColor.clear
    lbl.numberOfLines = 2
    lbl.text = "Scenario \n Date"
    return lbl
}()
    
    public let scnearioDatevalueLabel : UILabel = {
         let lbl = UILabel()
         lbl.textColor = .gray
         lbl.font = UIFont.systemFont(ofSize: 19)
         lbl.textAlignment = .center
         lbl.backgroundColor = UIColor.white
        lbl.layer.borderColor = UIColor.lightGray.cgColor
           lbl.layer.borderWidth = 0.6
       
//        lbl.layer.addBorder(edge: UIRectEdge.top, color: UIColor.red, thickness: 0.6)
//        lbl.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.red, thickness: 0.6)
//        lbl.layer.addBorder(edge: UIRectEdge.left, color: UIColor.red, thickness: 0.6)
//        lbl.layer.addBorder(edge: UIRectEdge.left, color: UIColor.red, thickness: 0)
         lbl.text = "9th August  \n 2019"
        lbl.numberOfLines = 2
         return lbl
    }()
    
    public let targetLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red:18/255, green:136/255, blue:175/255, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 0.5
        lbl.backgroundColor = UIColor.clear
        lbl.layer.borderColor = UIColor.lightGray.cgColor
           lbl.layer.borderWidth = 0.6
        lbl.numberOfLines = 2
        lbl.text = "Target \n  Value"
        return lbl
    }()
        
        public let targetValueLabel : UILabel = {
             let lbl = UILabel()
            lbl.textColor = .gray
             lbl.font = UIFont.systemFont(ofSize: 20)
             lbl.textAlignment = .center
             lbl.translatesAutoresizingMaskIntoConstraints = false
             lbl.backgroundColor = UIColor.white
            lbl.layer.borderColor = UIColor.lightGray.cgColor
               lbl.layer.borderWidth = 0.6
            lbl.numberOfLines = 2
             lbl.text = "64%"
             return lbl
        }()

    public let actualLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red:250/255, green:125/255, blue:57/255, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 0.5
        lbl.backgroundColor = UIColor.clear
        lbl.layer.borderColor = UIColor.lightGray.cgColor
           lbl.layer.borderWidth = 0.6
        lbl.numberOfLines = 2
        lbl.text = "Actual \n Value"
        return lbl
    }()
        
        public let actualValueLabel : UILabel = {
             let lbl = UILabel()
             lbl.textColor = .gray
             lbl.font = UIFont.systemFont(ofSize: 20)
             lbl.textAlignment = .center
             lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.layer.borderColor = UIColor.lightGray.cgColor
               lbl.layer.borderWidth = 0.6
             lbl.backgroundColor = UIColor.white
             lbl.text = "63 \n %"
            lbl.numberOfLines = 2
             return lbl
        }()

    
    public let operationViewbtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Operation View", for: .normal)
        btn.titleLabel?.textAlignment = .left
        btn.titleLabel?.textColor = UIColor.green
        btn.layer.cornerRadius = 0.5
        btn.backgroundColor = UIColor.black
        
        return btn
    }()

    public let managementViewbtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Management view", for: .normal)
        btn.titleLabel?.textAlignment = .left
        btn.titleLabel?.textColor = UIColor.green
        btn.layer.cornerRadius = 0.5
        btn.backgroundColor = UIColor.black
        
        return btn
    }()
    
    


public let chart2 : BarChartView = {
    let barchart = BarChartView()
    return barchart
}()

    let leftOperationview: UIView = {
           let v=UIView()
           v.backgroundColor = UIColor.green
           v.translatesAutoresizingMaskIntoConstraints=false
           //v.layer.borderWidth  = 2.0
           //  v.layer.borderColor = (UIColor.red as! CGColor)
           v.layer.cornerRadius = 0.25
           
           
           return v
       }()
    
    let dailybtnRightview: UIView = {
        let v=UIView()
        v.backgroundColor = UIColor.green
        v.translatesAutoresizingMaskIntoConstraints=false
        //v.layer.borderWidth  = 2.0
        //  v.layer.borderColor = (UIColor.red as! CGColor)
        v.layer.cornerRadius = 0.25
        
        
        return v
    }()

    
    let textField : UITextField = {
        var textFiled = UITextField()
        textFiled.backgroundColor = UIColor.white
        textFiled.borderStyle = UITextField.BorderStyle.line
        textFiled.placeholder = "Add your comment"
        return textFiled
        
    }()
    
   
    public let sendMailbtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("SEND EMAIL", for: .normal)
        btn.titleLabel?.textAlignment = .left
        
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
       btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn.backgroundColor = UIColor(red:61/255, green:188/255, blue:252/255, alpha: 1)
        
        return btn
    }()
    
    public let commentBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("COMMENT", for: .normal)
        btn.titleLabel?.textAlignment = .left
        
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
       btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn.backgroundColor = UIColor(red:61/255, green:188/255, blue:252/255, alpha: 1)
        
        return btn
    }()
    
    public let eprintbtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("E-PRINT", for: .normal)
        btn.titleLabel?.textAlignment = .left
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
       
       btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn.backgroundColor = UIColor(red:61/255, green:188/255, blue:252/255, alpha: 1)
        
        return btn
    }()
    
    public let currentrunningtargetValueLabel : UILabel = {
         let lbl = UILabel()
        lbl.textColor = .white
         lbl.font = UIFont.systemFont(ofSize: 10)
         lbl.textAlignment = .center
         lbl.translatesAutoresizingMaskIntoConstraints = false
         lbl.backgroundColor = UIColor.clear
      //  lbl.layer.borderColor = UIColor.lightGray.cgColor
         //  lbl.layer.borderWidth = 0.6
        lbl.numberOfLines = 2
         lbl.text = "Current Running Target Value : 64%"
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
    addSubview(containerview3)
    addSubview(operationViewbtn)
    addSubview(leftOperationview)
    addSubview(managementViewbtn)
    addSubview(containerView)
    addSubview(containerview2)
    addSubview(barchartcontainerView)
    addSubview(KpiNameLabel)
    addSubview(dailyLabelbtn)
    addSubview(dailybtnRightview)
    addSubview(weeklyLabelbtn)
    addSubview(monthlyLabelbtn)
    addSubview(KpiNameLabel)
    addSubview(scnearioDateLabel)
    addSubview(scnearioDatevalueLabel)
    addSubview(targetLabel)
    addSubview(targetValueLabel)
    addSubview(actualLabel)
    addSubview(actualValueLabel)
    barchartcontainerView.addSubview(chart2)
    addSubview(lastupdatedLabel)
    addSubview(lastupdatedDateLabel)
    addSubview(textField)
    addSubview(commentBtn)
    addSubview(sendMailbtn)
    addSubview(eprintbtn)
    addSubview(currentrunningtargetValueLabel)
    
    
    updateUII()
    //setChart()
    var dietChart = PieChartView(frame: CGRect(x:0,y:0,width:400,height:400))
    dietChart.backgroundColor = .black

  // createPieChart(chart: dietChart,property: properties, value: values)

}

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    func setChart(x : [Float] , y : [Float] , t : Float) {
        let actual = x  //v
        let target = y //th
        var dataEntries: [BarChartDataEntry] = []
        var months = y
        
//         let unitsSold = [2000.0, 40000.0, 8000.0]  //v
//         let test = [1, 2, 3] //th
//         var dataEntries: [BarChartDataEntry] = [
//         var months = ["Jan", "Feb", "Mar"]
         
         for i in 0..<months.count {
             
             let dataEntry = BarChartDataEntry(x: Double(target[i]), y: Double(actual[i]))
             
             dataEntries.append(dataEntry)
         }
         
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "KPI")
         
         let chartData = BarChartData(dataSet: chartDataSet)
    
        chart2.backgroundColor = UIColor.black
        chartDataSet.colors = [UIColor(red: 16/255, green: 135/255, blue: 72/255, alpha: 1)]
        chart2.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInCubic)
       // let ll = ChartLimitLine(limit: Double(x[0]), label: "Target")
       // chart2.rightAxis.addLimitLine(ll)
        var xAxis = chart2.xAxis
        var yAxis = chart2.leftAxis
        xAxis.labelTextColor = UIColor.white
        yAxis.labelTextColor = UIColor.white
        chart2.data = chartData
         
     }
    
func updateCellContentt(kpivalues : KPIValues , category : CategoryHealth)
{
    KpiNameLabel.text = kpivalues.kpiName
    scnearioDatevalueLabel.text = kpivalues.kpiDate
    targetValueLabel.text = kpivalues.target?.description
    actualValueLabel.text = kpivalues.actual?.description
    lastupdatedDateLabel.text = kpivalues.kpiDate
    currentrunningtargetValueLabel.text = "Current Running Target Value:" + kpivalues.target!.description
    setChart(x: [kpivalues.actual!], y: [kpivalues.target!] , t : kpivalues.target!)
    
    
}



func updateUII(){
    
    containerview3.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 10, paddingRight: 20, width: self.frame.width, height: 100, enableInsets: true)
    
    leftOperationview.anchor(top: containerview3.topAnchor, left: containerview3.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 5, height: 40, enableInsets: true)
    
    operationViewbtn.anchor(top: containerview3.topAnchor, left: leftOperationview.leftAnchor, bottom: nil, right: containerview3.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 100, height: 40, enableInsets: true)
    
    
    managementViewbtn.anchor(top: operationViewbtn.bottomAnchor, left: containerview3.leftAnchor, bottom: nil, right: containerview3.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 100, height: 40, enableInsets: true)
    
    containerView.anchor(top: containerview3.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 5, paddingRight: 20, width: self.frame.width, height: 200, enableInsets: true)
    
    KpiNameLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom:  nil, right: containerView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: self.frame.width - 20, height: 40, enableInsets: true)
    
    dailyLabelbtn.anchor(top: KpiNameLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: -5, paddingBottom: 10, paddingRight: 10, width: 160, height: 30, enableInsets: true)
    
    dailybtnRightview.anchor(top: KpiNameLabel.bottomAnchor, left: dailyLabelbtn.rightAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: -5, paddingBottom: 0, paddingRight: 0, width: 10, height: 32, enableInsets: true)
    
     weeklyLabelbtn.anchor(top: dailyLabelbtn.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: -5, paddingBottom: 10, paddingRight: 10, width: 160, height: 30, enableInsets: true)
    
    monthlyLabelbtn.anchor(top: weeklyLabelbtn.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: -5, paddingBottom: 10, paddingRight: 10, width: 160, height: 30, enableInsets: true)
    
    
      containerview2.anchor(top: containerView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: self.frame.width, height: 250, enableInsets: true)
    
    
   scnearioDateLabel.anchor(top: containerview2.topAnchor, left: containerview2.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 150, height: 60, enableInsets: true)

    scnearioDatevalueLabel.anchor(top: containerview2.topAnchor, left: scnearioDateLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 150, height: 60, enableInsets: true)
    
    targetLabel.anchor(top: scnearioDateLabel.bottomAnchor, left: containerview2.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 150, height: 60, enableInsets: true)
    
    targetValueLabel.anchor(top: scnearioDatevalueLabel.bottomAnchor, left: targetLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 150, height: 60, enableInsets: true)
    
    
    actualLabel.anchor(top: targetLabel.bottomAnchor, left: containerview2.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 150, height: 60, enableInsets: true)
    
    actualValueLabel.anchor(top: targetValueLabel.bottomAnchor, left: actualLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 60, enableInsets: true)
    
    
    barchartcontainerView.anchor(top: containerview2.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: self.frame.width, height: 500, enableInsets: true)
    
    lastupdatedLabel.anchor(top: barchartcontainerView.topAnchor, left: barchartcontainerView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 80, height: 50, enableInsets: true)
    
    lastupdatedDateLabel.anchor(top: lastupdatedLabel.topAnchor, left: barchartcontainerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 5, paddingRight: 0, width: 80, height: 50, enableInsets: true)
    
    textField.anchor(top: barchartcontainerView.topAnchor, left: lastupdatedLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 25, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 150, height: 20, enableInsets: true)
    
    commentBtn.anchor(top: barchartcontainerView.topAnchor, left: textField.rightAnchor, bottom: nil, right: nil, paddingTop: 25, paddingLeft: 25, paddingBottom: 5, paddingRight: 5, width: 70,  height: 20, enableInsets: true)
    
    chart2.anchor(top: lastupdatedDateLabel.bottomAnchor, left: barchartcontainerView.leftAnchor, bottom: nil, right: barchartcontainerView.rightAnchor, paddingTop: 50, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 300, height: 300, enableInsets: true)
    
    currentrunningtargetValueLabel.anchor(top: chart2.bottomAnchor, left: barchartcontainerView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 200, height: 30, enableInsets: true)
    
    sendMailbtn.anchor(top: currentrunningtargetValueLabel.bottomAnchor, left: barchartcontainerView.leftAnchor, bottom: barchartcontainerView.bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 70, paddingBottom: 10, paddingRight: 5, width: 70, height: 20, enableInsets: true)
    
    eprintbtn.anchor(top: currentrunningtargetValueLabel.bottomAnchor, left: sendMailbtn.rightAnchor, bottom: barchartcontainerView.bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 30, paddingBottom: 10, paddingRight: 5, width: 70, height: 20, enableInsets: true)
    

    
    targetLabel.layer.addBorder(edge: UIRectEdge.top, color: UIColor.red, thickness: 0.6)
       targetLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.red, thickness: 0.6)
       targetLabel.layer.borderWidth = 0.5
    
    targetValueLabel.layer.addBorder(edge: UIRectEdge.top, color: UIColor.gray, thickness: 0.6)
       targetValueLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.red, thickness: 0.6)
       targetValueLabel.layer.borderWidth = 0.5
    
    actualLabel.layer.addBorder(edge: UIRectEdge.top, color: UIColor.gray, thickness: 0.5)
       actualLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.red, thickness: 0)
       actualLabel.layer.borderWidth = 0.5
    
        actualValueLabel.layer.addBorder(edge: UIRectEdge.top, color: UIColor.red, thickness: 0.5)
       actualValueLabel.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.red, thickness: 0.5)
      actualValueLabel.layer.borderWidth = 0.5
       
       
       
    
   }

}
extension CALayer {


     func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {

         let border = CALayer()

         switch edge {
             case UIRectEdge.top:
              border.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: thickness)

             case UIRectEdge.bottom:
              border.frame = CGRect(x: 0, y: self.bounds.height - thickness,  width: self.bounds.width, height: thickness)

             case UIRectEdge.left:
              border.frame = CGRect(x: 0, y: 0,  width: thickness, height: self.bounds.height)

             case UIRectEdge.right:
              border.frame = CGRect(x: self.bounds.width - thickness, y: 0,  width: thickness, height: self.bounds.height)

             default:
              break
         }
         border.backgroundColor = color.cgColor;
         self.addSublayer(border)
     }
 }
