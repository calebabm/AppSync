//
//  AppSync.swift
//  AppSync
//
//  Created by Arnoldas Liudzius on 2022-01-18.
//

import Amplify

@objcMembers
public class AppSync: AppSyncProtocol {
    private let logger: LoggerProtocol
    
    public init(logger: LoggerProtocol) {
        self.logger = logger
    }

    public func configure(with configuration: AppSyncConfiguration) throws {
        do {
            // TODO: try Amplify.add(plugin: dataStorePlugin)
            try Amplify.configure()

            logger.logInfo("AppSync configuration successful",
                           parameters: ["establishment": "\(configuration.estabId)",
                                        "instance": "\(configuration.instanceURL)"])
        } catch {
            logger.logError("AppSync configuration failed",
                            parameters: ["establishment": "\(configuration.estabId)",
                                         "instance": "\(configuration.instanceURL)"])
            throw AppSyncError.configurationFailed
        }
    }
}
