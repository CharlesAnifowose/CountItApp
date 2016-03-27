//
//  Dictionatable.swift
//  ClickerApp
//
//  Created by Christopher Jimenez on 3/14/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Foundation


/**
 *  Classes that implement this can be converted to a from dictionaries
 */
public protocol Dictionatable{
    
    init(dictionary: [String : AnyObject])
    
    func toDictionary() -> [String : AnyObject]

}



