//
//  TipBrain.swift
//  Tipsy
//
//  Created by Jimmy Rao on 11/21/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct TipBrain {
    var billTotal: Float
    var splits: Int
    var tipPct: Float
    
    var total: Float {
        return billTotal * (1.0 + tipPct)
    }
    
    func calculatePerPerson() -> Float {
        return total / Float(splits)
    }
    
    func getTotal() -> Float {
        return calculatePerPerson()
    }
    
    func getSplit() -> Int {
        return splits
    }
    
    func getTip() -> Float {
        return tipPct
    }
}

