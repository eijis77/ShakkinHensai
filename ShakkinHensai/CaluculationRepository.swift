//
//  DoKeisan.swift
//  YouikuhiCalculation
//
//  Created by 柴英嗣 on 2021/04/15.
//

import Foundation

struct CaluculationRepository {

    var errorCallback : ((Error) -> Void)?
    
    func calculation(kariire: Float, kinnri: Float, year : Float, month : Float) -> Float{
        var result : Float = 0
        
        if kariire < 10 {
            result = year * 12 + month
            result = result * kariire * (kinnri) / 1200
        }
        if kariire >= 10 && kariire < 100 {
            result = year * 12 + month
            result = result * kariire * (kinnri) / 1200
        }
        if kariire >= 100 {
            result = year * 12 + month
            print(result)
            result = result * kariire * (kinnri) / 1200
        }
        print(result)
        return result + kariire
    }

}

