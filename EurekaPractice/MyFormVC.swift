//
//  MyFormVC.swift
//  EurekaPractice
//
//  Created by Hassan Ahmed Khan on 12/06/2018.
//  Copyright © 2018 Hassan Ahmed Khan. All rights reserved.
//

import UIKit
import Eureka

class MyFormVC: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        form +++ Section() { section in
            var header = HeaderFooterView<UIView>(.nibFile(name: "SectionHeader", bundle: Bundle.main))
            
            // Will be called every time the header appears on screen
            header.onSetupView = { view, _ in
                // Commonly used to setup texts inside the view
                // Don't change the view hierarchy or size here!
            }
            section.header = header
        }
            <<< TextRow() { row in
            row.title = "Text Row"
            row.placeholder = "Enter text here"
        }
            <<< PhoneRow() {
                $0.title = "Phone Row"
                $0.placeholder = "Add numbers here"
        }
            <<< LabelRow() {
                $0.title = "This row is disabled by default"
                $0.disabled = true
            }
            <<< TextRow() { row in
                row.title = "Text Row"
                row.placeholder = "Enter text here"
            }
            <<< PhoneRow() {
                $0.title = "Phone Row"
                $0.placeholder = "Add numbers here"
            }
            <<< TextRow() { row in
                row.title = "Text Row"
                row.placeholder = "Enter text here"
            }
            <<< PhoneRow() {
                $0.title = "Phone Row"
                $0.placeholder = "Add numbers here"
            }
            +++ Section(){ section in
                var header = HeaderFooterView<UIView>(.class)
                header.height = {100}
                header.onSetupView = { view, _ in
                    view.backgroundColor = .red
                    let tempView = UIView()
                    
                    tempView.translatesAutoresizingMaskIntoConstraints = false
                    view.addSubview(tempView)
                    
                    tempView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                    tempView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                    tempView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
                    
                    tempView.backgroundColor = .blue
                    
                    let label = UILabel()
                    label.text = "This is another customized section header"
                    
                    label.textColor = .white
                    label.translatesAutoresizingMaskIntoConstraints = false
                    view.addSubview(label)
                    label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
                    label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
                    label.topAnchor.constraint(equalTo: tempView.topAnchor, constant: 20).isActive = true
                    label.bottomAnchor.constraint(equalTo: tempView.bottomAnchor, constant: -20).isActive = true
                }
                section.header = header
            }
            <<< DateRow() {
            $0.title = "Date Row"
            $0.value = Date(timeIntervalSinceReferenceDate: 0)
        }
        +++ TextRow()
        +++ SelectableSection<ListCheckRow<String>>("Where do you live", selectionType: .singleSelection(enableDeselection: true))
        
        let continents = ["Africa", "Antarctica", "Asia", "Australia", "Europe", "North America", "South America"]
        for option in continents {
            form.last! <<< ListCheckRow<String>(option){ listRow in
                listRow.title = option
                listRow.selectableValue = option
                listRow.value = nil
            }
        }
        form +++
            MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete],
                               header: "Multivalued TextField",
                               footer: ".Insert adds a 'Add Item' (Add New Tag) button row as last cell.") {
                                $0.addButtonProvider = { section in
                                    return ButtonRow(){
                                        $0.title = "Add New Tag"
                                    }
                                }
                                $0.multivaluedRowToInsertAt = { index in
                                    return NameRow() {
                                        $0.placeholder = "Tag Name"
                                    }
                                }
                                $0 <<< NameRow() {
                                    $0.placeholder = "Tag Name"
                                }
        }
        
        self.navigationOptions =  RowNavigationOptions.Enabled.union(RowNavigationOptions.SkipCanNotBecomeFirstResponderRow)
        self.rowKeyboardSpacing = 50
        
        form +++ CustomRow()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
