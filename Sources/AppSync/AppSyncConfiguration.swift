//
//  AppSyncConfiguration.swift
//  AppSync
//
//  Created by Arnoldas Liudzius on 2022-01-21.
//

import Foundation

@objcMembers
public class AppSyncConfiguration: NSObject {
    let estabId: Int
    let instanceURL: String
    
    public init(estabId: Int,
                instanceUrl: String) {
        self.estabId = estabId
        instanceURL = instanceUrl
    }
}
