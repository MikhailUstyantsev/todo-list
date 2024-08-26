//
//  Utilities.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 25.08.2024.
//

import UIKit


final class Utilities {
    
    //MARK: Validation methods
    static func isValidString(str:String?) -> Bool {
        var str = str ?? ""
        str = str.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        
        if(str.count == 0)
        {
            return false
        }
        return true
    }
    
    class func getTrimmedString( strTarget:String?) -> String {
        let strTarget = strTarget ?? ""
        
        return strTarget.trimmingCharacters(in: .whitespacesAndNewlines)
        
    }
    
    //MARK: Show Alert
    static func showAlert(
        strTitle: String,
        strMessage: String?,
        parent: AnyObject,
        OKButtonTitle: String? ,
        CancelButtonTitle: String?,
        okBlock : (() -> Void)?,
        cancelBlock : (() -> Void)?
    )
    {
        let alert = UIAlertController(title: strTitle, message: (strMessage ?? ""), preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: (OKButtonTitle ?? "Okay"), style: .default) { (action:UIAlertAction!) in
            if (okBlock != nil) {
                okBlock!()
            }
        }
        alert.addAction(OKAction)
        
        if CancelButtonTitle != nil {
            let CancelAction = UIAlertAction(title: CancelButtonTitle, style: .default) { (action:UIAlertAction!) in
                if (cancelBlock != nil) {
                    cancelBlock!()
                }
            }
            alert.addAction(CancelAction)
        }
        
        parent.present(alert, animated: true, completion: nil)
        
    }
    
    
}
