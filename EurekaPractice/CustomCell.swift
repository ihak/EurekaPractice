//
//  CustomCell.swift
//  EurekaPractice
//
//  Created by Hassan Ahmed Khan on 12/06/2018.
//  Copyright © 2018 Hassan Ahmed Khan. All rights reserved.
//

import Foundation
import Eureka

// Custom Cell with value type: Bool
// The cell is defined using a .xib, so we can set outlets :)
public class CustomCell: Cell<Bool>, CellType {
    @IBOutlet weak var switchControl: UISwitch!
    @IBOutlet weak var label: UILabel!
    
    public override func setup() {
        super.setup()
        switchControl.addTarget(self, action: #selector(CustomCell.switchValueChanged), for: .valueChanged)
    }
    
    @objc func switchValueChanged(){
        row.value = switchControl.isOn
        row.updateCell() // Re-draws the cell which calls 'update' bellow
    }
    
    public override func update() {
        super.update()
        backgroundColor = (row.value ?? false) ? .white : .black
    }
}
