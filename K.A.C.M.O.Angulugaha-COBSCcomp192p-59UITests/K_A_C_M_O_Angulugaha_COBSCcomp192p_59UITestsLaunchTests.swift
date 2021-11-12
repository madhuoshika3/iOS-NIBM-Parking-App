//
//  K_A_C_M_O_Angulugaha_COBSCcomp192p_59UITestsLaunchTests.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59UITests
//
//  Created by Madhu Oshika Angulugaha on 2021-11-12.
//

import XCTest

class K_A_C_M_O_Angulugaha_COBSCcomp192p_59UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
