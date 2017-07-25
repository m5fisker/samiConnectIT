//
//  SalesOrderItemViewController.swift
//  Online
//
//  Copyright © 2016 SAP. All rights reserved.
//

import UIKit

class SalesOrderItemViewController: UIViewController, URLSessionTaskDelegate, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {

    private var salesOrderItems: [MyPrefixSalesOrderItem] = []

    @IBOutlet var SalesOrderItemTable: UITableView!
    @IBOutlet var infoText: UITextView!

    private var oDataModel: ODataModel?

    func initialize(oDataModel: ODataModel) {
        self.oDataModel = oDataModel
    }

    /// Delegate function from UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        OperationQueue.main.addOperation {
            self.updateStatus(status: "OData Loaded")
        }

        SalesOrderItemTable.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return salesOrderItems.count // your number of cell here
    }

    /// Delegate function from UITableViewDataSource
    ///
    /// - Parameters:
    ///   - tableView:
    ///   - indexPath:
    /// - Returns: fills the cells with the Sales order
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let singleOrderItem = salesOrderItems[indexPath.row]
        cell.textLabel?.text = singleOrderItem.productID
        cell.detailTextLabel?.text = (singleOrderItem.taxAmount?.toString())! + singleOrderItem.currencyCode!

        return cell

    }

    /// loads the current salesorderItem
    ///
    /// - Parameter newItems: the current salesorderItem
    public func loadSalesOrderItems(newItems: [MyPrefixSalesOrderItem]) {
        salesOrderItems = newItems
    }

    /// Handler to prepare the segue
    ///
    /// - Parameters:
    ///   - segue:
    ///   - sender:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let selectedRow = sender as! UITableViewCell
            let selectedIndexPath = SalesOrderItemTable.indexPath(for: selectedRow)!
            let order: MyPrefixSalesOrderItem = salesOrderItems[selectedIndexPath.row]
            let detailView = segue.destination as! DetailTableViewController
            detailView.initialize(oDataModel: oDataModel!)
            detailView.loadSalesOrderItem(item: order)

        }
    }

    /// updates the
    ///
    /// - Parameter status: <#status description#>
    func updateStatus(status: String) {
        let statusUpdate = "Online: \n"
        infoText.text = statusUpdate + status
    }
}
