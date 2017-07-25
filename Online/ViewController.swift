//
//  ViewController.swift
//  Online
//
//  Copyright © 2016 SAP. All rights reserved.
//
import Foundation
import SAPFoundation
import UIKit


class ViewController: UIViewController {

    private var oDataModel: ODataModel?

    func initialize(oDataModel: ODataModel){
        self.oDataModel = oDataModel
    }
    /// Delegate function from UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        infoText.text = "Authentication was successful"
    }

    @IBAction func sendVisitorData(_ sender: UIButton) {
                self.oDataModel?.sendCustomerData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var infoText: UITextView!
    
   /// Handler to prepare the segue
    ///
    /// - Parameters:
    ///   - segue:
    ///   - sender:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSalesOrders" {
            let view = segue.destination as! SalesOrderViewController
            view.initialize(oDataModel: oDataModel!)
        }
    }
}

