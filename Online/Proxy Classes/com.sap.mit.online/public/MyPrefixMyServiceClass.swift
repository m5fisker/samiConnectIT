// # Proxy Compiler 1.7.3.17

import Foundation
import SAPOData

open class MyPrefixMyServiceClass<Provider: DataServiceProvider>: DataService<Provider> {

    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = MyPrefixMyServiceClassMetadata.document
    }

    open func customers(query: DataQuery = DataQuery()) throws -> [MyPrefixCustomer] {
        return try MyPrefixCustomer.array(from: executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.customers)).entityList())
    }

    open func customers(query: DataQuery = DataQuery(), completionHandler: @escaping ([MyPrefixCustomer]?, Error?) -> Void) {
        addBackgroundOperation {
            do {
                let result: [MyPrefixCustomer] = try self.customers(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func generateSamplePurcharOrders(query: DataQuery = DataQuery()) throws -> Bool? {
        return try BooleanValue.optional(executeQuery(query.invoke(MyPrefixMyServiceClassMetadata.ActionImports.generateSamplePurcharOrders, ParameterList.empty)).result)
    }

    open func generateSamplePurcharOrders(query: DataQuery = DataQuery(), completionHandler: @escaping (Bool?, Error?) -> Void) {
        addBackgroundOperation {
            do {
                let result: Bool? = try self.generateSamplePurcharOrders(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func generateSampleSalesOrders(query: DataQuery = DataQuery()) throws -> Bool? {
        return try BooleanValue.optional(executeQuery(query.invoke(MyPrefixMyServiceClassMetadata.ActionImports.generateSampleSalesOrders, ParameterList.empty)).result)
    }

    open func generateSampleSalesOrders(query: DataQuery = DataQuery(), completionHandler: @escaping (Bool?, Error?) -> Void) {
        addBackgroundOperation {
            do {
                let result: Bool? = try self.generateSampleSalesOrders(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func productCategories(query: DataQuery = DataQuery()) throws -> [MyPrefixProductCategory] {
        return try MyPrefixProductCategory.array(from: executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.productCategories)).entityList())
    }

    open func productCategories(query: DataQuery = DataQuery(), completionHandler: @escaping ([MyPrefixProductCategory]?, Error?) -> Void) {
        addBackgroundOperation {
            do {
                let result: [MyPrefixProductCategory] = try self.productCategories(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func productTexts(query: DataQuery = DataQuery()) throws -> [MyPrefixProductText] {
        return try MyPrefixProductText.array(from: executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.productTexts)).entityList())
    }

    open func productTexts(query: DataQuery = DataQuery(), completionHandler: @escaping ([MyPrefixProductText]?, Error?) -> Void) {
        addBackgroundOperation {
            do {
                let result: [MyPrefixProductText] = try self.productTexts(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func products(query: DataQuery = DataQuery()) throws -> [MyPrefixProduct] {
        return try MyPrefixProduct.array(from: executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.products)).entityList())
    }

    open func products(query: DataQuery = DataQuery(), completionHandler: @escaping ([MyPrefixProduct]?, Error?) -> Void) {
        addBackgroundOperation {
            do {
                let result: [MyPrefixProduct] = try self.products(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func purchaseOrderHeaders(query: DataQuery = DataQuery()) throws -> [MyPrefixPurchaseOrderHeader] {
        return try MyPrefixPurchaseOrderHeader.array(from: executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.purchaseOrderHeaders)).entityList())
    }

    open func purchaseOrderHeaders(query: DataQuery = DataQuery(), completionHandler: @escaping ([MyPrefixPurchaseOrderHeader]?, Error?) -> Void) {
        addBackgroundOperation {
            do {
                let result: [MyPrefixPurchaseOrderHeader] = try self.purchaseOrderHeaders(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func purchaseOrderItems(query: DataQuery = DataQuery()) throws -> [MyPrefixPurchaseOrderItem] {
        return try MyPrefixPurchaseOrderItem.array(from: executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.purchaseOrderItems)).entityList())
    }

    open func purchaseOrderItems(query: DataQuery = DataQuery(), completionHandler: @escaping ([MyPrefixPurchaseOrderItem]?, Error?) -> Void) {
        addBackgroundOperation {
            do {
                let result: [MyPrefixPurchaseOrderItem] = try self.purchaseOrderItems(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func resetSampleData(query: DataQuery = DataQuery()) throws -> Bool? {
        return try BooleanValue.optional(executeQuery(query.invoke(MyPrefixMyServiceClassMetadata.ActionImports.resetSampleData, ParameterList.empty)).result)
    }

    open func resetSampleData(query: DataQuery = DataQuery(), completionHandler: @escaping (Bool?, Error?) -> Void) {
        addBackgroundOperation {
            do {
                let result: Bool? = try self.resetSampleData(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func salesOrderHeaders(query: DataQuery = DataQuery()) throws -> [MyPrefixSalesOrderHeader] {
        return try MyPrefixSalesOrderHeader.array(from: executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.salesOrderHeaders)).entityList())
    }

    open func salesOrderHeaders(query: DataQuery = DataQuery(), completionHandler: @escaping ([MyPrefixSalesOrderHeader]?, Error?) -> Void) {
        addBackgroundOperation {
            do {
                let result: [MyPrefixSalesOrderHeader] = try self.salesOrderHeaders(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func salesOrderItems(query: DataQuery = DataQuery()) throws -> [MyPrefixSalesOrderItem] {
        return try MyPrefixSalesOrderItem.array(from: executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.salesOrderItems)).entityList())
    }

    open func salesOrderItems(query: DataQuery = DataQuery(), completionHandler: @escaping ([MyPrefixSalesOrderItem]?, Error?) -> Void) {
        addBackgroundOperation {
            do {
                let result: [MyPrefixSalesOrderItem] = try self.salesOrderItems(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func stock(query: DataQuery = DataQuery()) throws -> [MyPrefixStock] {
        return try MyPrefixStock.array(from: executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.stock)).entityList())
    }

    open func stock(query: DataQuery = DataQuery(), completionHandler: @escaping ([MyPrefixStock]?, Error?) -> Void) {
        addBackgroundOperation {
            do {
                let result: [MyPrefixStock] = try self.stock(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func suppliers(query: DataQuery = DataQuery()) throws -> [MyPrefixSupplier] {
        return try MyPrefixSupplier.array(from: executeQuery(query.from(MyPrefixMyServiceClassMetadata.EntitySets.suppliers)).entityList())
    }

    open func suppliers(query: DataQuery = DataQuery(), completionHandler: @escaping ([MyPrefixSupplier]?, Error?) -> Void) {
        addBackgroundOperation {
            do {
                let result: [MyPrefixSupplier] = try self.suppliers(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }
}
