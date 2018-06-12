//
//  CustomRow.swift
//  EurekaPractice
//
//  Created by Hassan Ahmed Khan on 12/06/2018.
//  Copyright © 2018 Hassan Ahmed Khan. All rights reserved.
//

import Foundation
import Eureka

// The custom Row also has the cell: CustomCell and its correspond value
public final class CustomRow: Row<CustomCell>, RowType {
    required public init(tag: String?) {
        super.init(tag: tag)
        // We set the cellProvider to load the .xib corresponding to our cell
        cellProvider = CellProvider<CustomCell>(nibName: "CustomCell")
    }
}
