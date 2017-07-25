//
//  DetailTableViewController.swift
//  Online
//
//  Copyright © 2017 SAP. All rights reserved.
//

import UIKit

class DetailTableViewController: UIViewController, Notifier, URLSessionTaskDelegate, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {

    private var detailItem: MyPrefixSalesOrderItem!
    private var oDataModel: ODataModel?

    func initialize(oDataModel: ODataModel) {
        self.oDataModel = oDataModel
    }

    @IBOutlet var DetailTable: UITableView!
    @IBOutlet var InfoText: UITextView!

    /// Delegate function from UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        OperationQueue.main.addOperation {
            self.InfoText.text = "OData Loaded"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /// action which triggers an update of the current item
    ///
    /// - Parameter sender:
    @IBAction func updateDetails(_: Any) {
        
        self.displayAlert(title: "Alert", message: "Updating data is only in the advanced tutorial possible", buttonText: "OK")
        
        var statusString = String("")
//        let index = IndexPath(row: 4, section: 0)
//        guard let cell = DetailTable.cellForRow(at: index) as? EditableCell else {
//            updateStatus(status: "Update failed")
//            return
//        }
//        let inputString = cell.valueTextField.text!
//        do {
//            try oDataModel!.updateSalesOrderitem(currentQuantity: Int(inputString)!, currentSalesOrderItem: detailItem)
//        } catch {
//            statusString = String(error.localizedDescription)
//        }
//        if statusString!.isEmpty {
//            statusString = String("Update was Successful")
//        }
        OperationQueue.main.addOperation {
            self.updateStatus(status: statusString!)
        }

    }

    /// Delegate function from UITableViewDataSource
    ///
    /// - Parameter tableView:
    /// - Returns: that this table only will have 1 section
    func numberOfSections(in _: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    /// Delegate function from UITableViewDataSource
    ///
    /// - Parameters:
    ///   - tableView:
    ///   - section:
    /// - Returns: returns the number of rows the table should have
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 5 // your number of cell here
    }

    /// Delegate function from UITableViewDataSource
    ///
    /// - Parameters:
    ///   - tableView:
    ///   - indexPath:
    /// - Returns: fills the cells with the Salesorder
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! EditableCell
        switch indexPath.row {
        case 0:
            cell.unitLabel?.text = ""
            cell.titleLabel.text = "Product ID"
            cell.valueTextField.text = detailItem.productID
            break
        case 1:
            cell.unitLabel?.text = detailItem.currencyCode
            cell.titleLabel.text = "Gross Amount"
            cell.valueTextField.text = detailItem.grossAmount?.toString()
            break
        case 2:
            cell.unitLabel?.text = detailItem.currencyCode
            cell.titleLabel.text = "Tax Amount"
            cell.valueTextField.text = detailItem.taxAmount?.toString()
            break
        case 3:
            cell.unitLabel?.text = ""
            cell.titleLabel.text = "Item Number"
            cell.valueTextField.text = String(describing: detailItem.itemNumber)
            break
        case 4:
            cell.unitLabel?.text = detailItem.quantityUnit
            cell.titleLabel.text = "Quantity"
            let value: Int = (detailItem.quantity?.intValue())!
            cell.valueTextField.text = String(value)
            cell.valueTextField.allowsEditingTextAttributes = true
            cell.valueTextField.isEnabled = true
            break
        default: break

        }

        return cell

    }

    /// loads the current salesorderItem
    ///
    /// - Parameter newItems: the current salesorderItem
    func loadSalesOrderItem(item: MyPrefixSalesOrderItem) {
        detailItem = item
    }

    /// updates the
    ///
    /// - Parameter status: <#status description#>
    func updateStatus(status: String) {
        let statusUpdate = "Online: \n"
        InfoText.text = statusUpdate + status
    }
}
