//
//  AppDelegate.swift
//  Get_Woke!
//
//  Created by Tomoki Takasawa on 4/15/19.
//  Copyright © 2019 Mike. All rights reserved.
//
//

import Foundation

protocol Persistable{
    var ud: UserDefaults {get}
    var persistKey : String {get}
    func persist()
    func unpersist()
}
