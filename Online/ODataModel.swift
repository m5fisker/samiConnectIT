//
//  ODataModel.swift
//
//  Copyright © 2016 Lechner, Sami. All rights reserved.
//

import Foundation
import SAPFoundation
import SAPOData
import SAPCommon

class ODataModel {
    /// create a Odata Online Provider
    private let espmOdataService: MyPrefixMyServiceClass<OnlineODataProvider>
    
    public static var oDataModel: ODataModel?
    
    /// initialise the data service provider for online OData.
    init(urlSession: SAPURLSession) {
        let odataProvider = OnlineODataProvider(serviceName: "myServiceName", serviceRoot: Authenticator.Constants.appURL)
        odataProvider.sapURLSession = urlSession

        espmOdataService = MyPrefixMyServiceClass(provider: odataProvider)
        // To update entity force to use X-HTTP-Method header
        _ = espmOdataService.networkOptions.tunneledMethods.append("MERGE")
    
        Logger.root.logLevel = LogLevel.debug

        espmOdataService.traceRequests = true
        espmOdataService.prettyTracing = true
        espmOdataService.traceWithData = true

    }
    
    public func createCustomer(customer: MyPrefixCustomer, completion: @escaping (Error?) -> Void) {
        espmOdataService.createEntity(customer) { error in
            if let error = error {
                completion(error)
                return
            }
            
            completion(nil)
        }
    }
    
    /// loads all sales orders and their items
    ///
    /// - Returns: list of sales orders
    /// - Throws: error
    func loadSalesOrders(completionHandler: @escaping (_ result: [MyPrefixSalesOrderHeader]?, _ error: String?) -> Void) {

        let query = DataQuery().orderBy(MyPrefixSalesOrderHeader.salesOrderID).expand(MyPrefixSalesOrderHeader.items)
            espmOdataService.salesOrderHeaders(query: query) { salesOrders, error in
                if let error = error {
                    completionHandler(nil, "Loading Sales Orders failed \(error.localizedDescription)")
                    return
                }
                completionHandler(salesOrders!, nil)
            }
        
    }
    func sendCustomerData(){
        let customer = MyPrefixCustomer()
//        customer.city = "Dubai"
//        customer.firstName = "first"
//        customer.country = "Dubai"
        customer.dateOfBirth = LocalDateTime.from(utc: Date())
        customer.emailAddress = "email"
//        customer.lastName = "last"
//        customer.houseNumber = "12"
//        customer.phoneNumber = "134134"
//        customer.postalCode = "324234"
//        customer.street = "myStreet"
//        customer.customerID = "13241234"
//
//        customer.updatedTimestamp = LocalDateTime.from(utc: Date())
            espmOdataService.createEntity(customer)
            { error in
                if let error = error {
                    DebugConsole.log(message: error.localizedDescription)
                    return
                }
        }

    

    }
    /// updates a single sales order item
    ///
    /// - Parameters:
    ///   - currentQuantity: int of the new quantity
    ///   - currentSalesOrderItem: current sales order which is supposed to updated
    /// - Throws: error
    func updateSalesOrderitem(currentQuantity: Int, currentSalesOrderItem: MyPrefixSalesOrderItem) throws {
        currentSalesOrderItem.quantity = BigDecimal(currentQuantity)

        do {
            
            try espmOdataService.updateEntity(currentSalesOrderItem)
        } catch {
            // handle error here
            throw error
        }
    }
}
