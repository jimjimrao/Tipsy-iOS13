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
    
    
    func calculatePerPerson() -> Float {
        let totalWithTip = self.billTotal * (1.0 + self.tipPct)
        return totalWithTip / Float(self.splits)
        
    }
}
