//
//  What_NextUITests_PupilLoginViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_PupilLoginViewController: XCTestCase {

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

    func testValidPupilLogin() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // check that the pupil login is valid
        
        // move to pupil login screen
        let pupilLogin = app/*@START_MENU_TOKEN@*/.staticTexts["Pupil Login"]/*[[".buttons[\"Pupil Login\"].staticTexts[\"Pupil Login\"]",".staticTexts[\"Pupil Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        pupilLogin.tap()  //press the pupil login button
        
        
        
        /*
        // add pupil login name
        //=======
        
        //let element = app.windows.children(matching: .other).element.children(matching: .other).element
        //element.children(matching: .other).element.children(matching: .other).element.tap()
        let pupilLoginTextField = app/*@START_MENU_TOKEN@*/.staticTexts["Pupil Login"]/*[[".buttons[\"Pupil Login\"].staticTexts[\"Pupil Login\"]",".staticTexts[\"Pupil Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        pupilLoginTextField.tap() //move cursor to login
        pupilLoginTextField.typeText("ggg")
        //element.children(matching: .other).element(boundBy: 0).children(matching: .textField).element.tap()
        //app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .secureTextField).element.tap()
        
        //=======
        
        */
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
