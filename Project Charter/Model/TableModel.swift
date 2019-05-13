//
//  TableModel.swift
//  Project Charter
//
//  Created by Vishal Hosakere on 12/05/19.
//  Copyright © 2019 Excelsior. All rights reserved.
//

import Foundation
import UIKit

struct allTables{
    var tables: [Table]
    
    init() {
        tables = [Table(),Table(),Table(),Table(),Table(),Table(),Table(),Table()]
    }
    
    mutating func setTable(withIndex idx: Int, withTable table: Table){
        if idx > 7{
            return
        }
        tables[idx] = table
    }
    
    func getTable(withIndex idx: Int) -> Table?{
        if idx > 7{
            return nil
        }
        return tables[idx]
    }
}

struct Table{
    var textArray: [[String]]
    var count = 0
    init(){
        textArray = [[],[],[]]
    }
    
    mutating func setArray(withIndex idx: Int,withArray array: [String] ){
        if idx > 2{
            return
        }
        textArray[idx] = array
    }
    
    func getArray(withIndex idx: Int) -> [String]?{
        if idx > 2{
            return nil
        }
        return textArray[idx]
    }
}
