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
    
   // override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
   // }

    func testValidPupilLogin() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // check that the pupil login is valid
        
        // move to pupil login screen
        let pupilLogin = app/*@START_MENU_TOKEN@*/.staticTexts["Pupil Login"]/*[[".buttons[\"Pupil Login\"].staticTexts[\"Pupil Login\"]",".staticTexts[\"Pupil Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        pupilLogin.tap()  //press the pupil login button
        
        
        // verify title is of the pupil login screen
        let pupilLoginTitle = app.staticTexts["Pupil Login"]
        XCTAssertTrue(pupilLoginTitle.exists)
        
        // enter a valid pupil username
        let validUsername = "sasha"
        let pupilusernametextfieldTextField = app.textFields["pupilUserNameTextField"]
        XCTAssertTrue(pupilusernametextfieldTextField.exists)       // check the field exists
        pupilusernametextfieldTextField.tap()                       // double tap
        pupilusernametextfieldTextField.tap()
        pupilusernametextfieldTextField.typeText (validUsername)    // enter the username
        
        // enter a valid password
        let validPassword = "brodie\n"
        let passwordtextfieldSecureTextField = app.secureTextFields["passwordTextField"]
        XCTAssertTrue(passwordtextfieldSecureTextField.exists)      // check the field exists
        passwordtextfieldSecureTextField.tap()                      // double tap
        passwordtextfieldSecureTextField.tap()
        passwordtextfieldSecureTextField.typeText(validPassword)    // enter a valid password

        // press the Sign-In key
        pupilusernametextfieldTextField.tap()  // workaround to get rid of keyboard
        app.buttons["SignInButton"].forceTapElement()
             
        //let moodPopup = app.staticTexts["How are you feeling today?"]
        //XCTAssertTrue(moodPopup.exists)       // check the field exists which means successfuly logged-in
        

    } //testValidPupilLogin
    
    func testInvalidPupilLogin() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // check that the pupil login is valid
        
        // move to pupil login screen
        let pupilLogin = app/*@START_MENU_TOKEN@*/.staticTexts["Pupil Login"]/*[[".buttons[\"Pupil Login\"].staticTexts[\"Pupil Login\"]",".staticTexts[\"Pupil Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        pupilLogin.tap()  //press the pupil login button
        
        
        // verify title is of the pupil login screen
        let pupilLoginTitle = app.staticTexts["Pupil Login"]
        XCTAssertTrue(pupilLoginTitle.exists)
        
        // enter a invalid pupil username
        let invalidUsername = "fred"
        let pupilusernametextfieldTextField = app.textFields["pupilUserNameTextField"]
        XCTAssertTrue(pupilusernametextfieldTextField.exists)       // check the field exists
        pupilusernametextfieldTextField.tap()                       // double tap
        pupilusernametextfieldTextField.tap()
        pupilusernametextfieldTextField.typeText (invalidUsername)    // enter the username
        
        // enter a invalid password
        let invalidPassword = "bob\n"
        let passwordtextfieldSecureTextField = app.secureTextFields["passwordTextField"]
        XCTAssertTrue(passwordtextfieldSecureTextField.exists)      // check the field exists
        passwordtextfieldSecureTextField.tap()                      // double tap
        passwordtextfieldSecureTextField.tap()
        passwordtextfieldSecureTextField.typeText(invalidPassword)    // enter a invalid password

        // press the Sign-In key
        pupilusernametextfieldTextField.tap()  // workaround to get rid of keyboard
        app.buttons["SignInButton"].forceTapElement()
                     
        // confirm that an error message is dislayed
        let errorMessage = app.staticTexts["Unknown User - please try again!"]
        XCTAssertTrue(errorMessage.exists)      // check the field exists
 
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    } //testInvalidPupilLogin

}

extension XCUIElement {
    func forceTapElement() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
            coordinate.tap()
        }
    }
}
