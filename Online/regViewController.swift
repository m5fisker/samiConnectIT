//
//  regViewController.swift
//  Online
//
//  Created by Kumar Soorya on 7/25/17.
//  Copyright © 2017 SAP. All rights reserved.
//

import UIKit

class regViewController: UIViewController {

    @IBOutlet var cityfunc: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

            }

    @IBAction func onNext(_ sender: Any) {
        var customer = MyPrefixCustomer()
        customer.lastName = "test"
        
        ODataModel.oDataModel?.createCustomer(customer: customer) { error in
            
        }
        self.performSegue(withIdentifier: "interests", sender: sender)
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
