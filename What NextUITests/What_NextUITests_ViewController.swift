//
//  What_NextUITests_ViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_ViewController: XCTestCase {

    /*
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
     */
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStartupScreen() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // check that the pupil login button exists
        let pupilLogin = app/*@START_MENU_TOKEN@*/.staticTexts["Pupil Login"]/*[[".buttons[\"Pupil Login\"].staticTexts[\"Pupil Login\"]",".staticTexts[\"Pupil Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(pupilLogin.exists)
        
        // check that the teacher login button exists
        let teacherLogin = app/*@START_MENU_TOKEN@*/.staticTexts["Teacher Login"]/*[[".buttons[\"Teacher Login\"].staticTexts[\"Teacher Login\"]",".staticTexts[\"Teacher Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(teacherLogin.exists)

        // check that setting up a class button exists
        let setupClass = app.staticTexts["Teacher setting up a class?"]
        XCTAssertTrue(setupClass.exists)
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    /*
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
 */
}
