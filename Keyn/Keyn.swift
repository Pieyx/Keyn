//
//  Keyn.swift
//  Keyn
//
//  Created by Jood Khoja on 12/10/1445 AH.
//

import Foundation

struct Keyn {
    
  
  let fundOwner: String
    let name: String
    let minLimit: Int
    let riskLevel: String
    let subcRate: Double
    let propertyType: String
    let description: String
    let Logo: String
    
    init(name:String, fundOwner:String, riskLevel:String,description:String,minLimit:Int ,subsRate:Double, propertyType: String , Logo:String) {
        self.name=name
        self.fundOwner=fundOwner
        self.riskLevel=riskLevel
        self.minLimit=minLimit
        self.subcRate=subsRate
        self.propertyType=propertyType
        self.description=description
        self.Logo=Logo
    }
}
var keyns: Array<Keyn> =
[Keyn(name: "d",
      fundOwner: "شركة الاهلي المالية",
      riskLevel: "منخفضة",
      description:"المحافظة على رأس المال",
      minLimit: 5000, subsRate: 0.0, propertyType: "Apartment", Logo: "Apart"),
 
 Keyn(name: "صندوق بيت المال الخليجي للاسهم السعودية",
     fundOwner: "بيت المال الخليجي ",
     riskLevel: "عالية",
     description:"يسعى مدير الصندوق لتحقيق نمو في رأس المال على المدى الطويل، وذلك من خالل االستثمار في أسهم الشركات أهداف الصندوق المدرجة في سوق األسهم السعودية",
     minLimit: 2000, subsRate: 2.0, propertyType: "Villa", Logo: "Apart"),
 ]
