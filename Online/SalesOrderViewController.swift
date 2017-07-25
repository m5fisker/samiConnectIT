//
//  SalesOrderViewController
//  Online
//
//  Copyright © 2016 SAP. All rights reserved.
//

import SAPFoundation
import UIKit
class SalesOrderViewController: UIViewController, URLSessionTaskDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var infoText: UITextView!
    @IBOutlet var SalesOrderTable: UITableView!

    private var salesOrders = [MyPrefixSalesOrderHeader]()
    private var startTime = NSDate()
    private var oDataModel: ODataModel?

    func initialize(oDataModel: ODataModel) {
        self.oDataModel = oDataModel
    }

    /// delegate function from UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false

        startTime = NSDate()
        // Do any additional setup after loading the view
        updateStatus(status: "Loading OData....")
        oDataModel!.loadSalesOrders { resultSalesOrders, error in

            var statusString = String("")
            if let error = error {
                self.updateStatus(status: error)
            }
            if let tempSalesOrders = resultSalesOrders {
                self.salesOrders = tempSalesOrders
                let endTime = NSDate()
                let timeInterval: Double = endTime.timeIntervalSince(self.startTime as Date) // <<<<< Difference in seconds (double)
                let finalTime: String = String(format: "%.3f", timeInterval)
                statusString = String("OData loaded in " + finalTime + "sec")

            }
            OperationQueue.main.addOperation {
                self.SalesOrderTable.reloadData()
                self.updateStatus(status: statusString!)

            }
        }

    }

    /// Delegate function from UITableViewDataSource
    ///
    /// - Parameter tableView:
    /// - Returns: that this table only will have 1 section
    func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    /// Delegate function from UITableViewDataSource
    ///
    /// - Parameters:
    ///   - tableView:
    ///   - section:
    /// - Returns: returns the number of rows the table should have
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return salesOrders.count // your number of cell here
    }

    /// Delegate function from UITableViewDataSource
    ///
    /// - Parameters:
    ///   - tableView:
    ///   - indexPath:
    /// - Returns: fills the cells with the Sales order
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SalesOrderCell", for: indexPath)
        let singleOrder = salesOrders[indexPath.row]
        cell.textLabel?.text = singleOrder.salesOrderID
        cell.detailTextLabel?.text = (singleOrder.taxAmount?.toString())! + singleOrder.currencyCode!

        return cell
    }

    func tableView(_: UITableView, didSelectRowAt _: IndexPath) {
    }

    /// Handler to prepare the segue
    ///
    /// - Parameters:
    ///   - segue:
    ///   - sender:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSalesOrderItem" {
            /// check email to implement this via sender
            let selectedRow = sender as! UITableViewCell
            let selectedIndexPath = SalesOrderTable.indexPath(for: selectedRow)!
            let order: MyPrefixSalesOrderHeader = salesOrders[selectedIndexPath.row]
            let itemViewControler = segue.destination as! SalesOrderItemViewController
            itemViewControler.initialize(oDataModel: oDataModel!)
            itemViewControler.loadSalesOrderItems(newItems: order.items)
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
