//
// ViewController+KeyboardNotification.swift
// Online
//
//  Copyright © 2016. SAP. All rights reserved.
//

import UIKit

extension UIViewController {

    // Register the keyboard for notifications in viewDidLoad
    func subscribeForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    // Unregister the keyboard for notifications in viewWillDisappear
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    // Shrink view if keyboard show notification comes
    func keyboardWillShow(notification _: NSNotification) {
        // To be overriden in selected ViewControllers, because their design can be different
    }

    // Resize view if keyboard hide notification comes
    func keyboardWillHide(notification _: NSNotification) {
        // To be overriden in selected ViewControllers, because their design can be different
    }

    func displayAlert(title: String, message: String, buttonText: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // Create the actions
        let buttonAction = UIAlertAction(title: buttonText, style: UIAlertActionStyle.default) {
            _ in
            alertController.dismiss(animated: true, completion: nil)
        }
        // Add the actions
        alertController.addAction(buttonAction)

        // Present the controller
        present(alertController, animated: true, completion: nil)
    }
}
