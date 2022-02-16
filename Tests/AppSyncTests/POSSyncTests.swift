//
//  AppSyncTests.swift
//  AppSyncTests
//
//  Created by Arnoldas Liudzius on 2022-01-17.
//

@testable import AppSync
import XCTest

class AppSyncTests: XCTestCase {
    private var logger: LoggerMock!
    private var appSync: AppSync!
    
    override func setUpWithError() throws {
        logger = LoggerMock()
        appSync = AppSync(logger: logger)
    }

    func testConfigure_configurationFailed() {
        var thrownError: Error?
        let estabId = 123
        let instanceUrl = "www.test.com"
        
        let config = AppSyncConfiguration(estabId: estabId,
                                          instanceUrl: instanceUrl)
        XCTAssertThrowsError(try appSync.configure(with: config)) {
            thrownError = $0
        }
        
        XCTAssertEqual(thrownError as? AppSyncError, .configurationFailed)
        
        XCTAssertEqual(logger.lastLogType, .error)
        XCTAssertEqual(logger.lastLogMessage, "AppSync configuration failed")
        XCTAssertEqual(logger.lastParameters, ["establishment": "\(estabId)",
                                               "instance": "\(instanceUrl)"])
    }
}

private class LoggerMock: LoggerProtocol {
    private(set) var lastLogMessage: String?
    private(set) var lastLogType: LogType?
    private(set) var lastParameters: [String: String]?
    
    func log(message: String,
             parameters: [String: String],
             type: LogType) {
        lastLogMessage = message
        lastLogType = type
        lastParameters = parameters
    }
}
