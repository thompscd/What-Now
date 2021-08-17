//
//  What_NextUITests_MoodPopupViewController.swift
//  What NextUITests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest

class What_NextUITests_MoodPopupViewController: XCTestCase {

    // check the field are correct on mood popup screen
    func testMoodPopupScreen() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // move to pupil login screen
        let pupilLogin = app/*@START_MENU_TOKEN@*/.staticTexts["Pupil Login"]/*[[".buttons[\"Pupil Login\"].staticTexts[\"Pupil Login\"]",".staticTexts[\"Pupil Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        pupilLogin.tap()  //press the pupil login button
        
        
        // verify title is of the pupil login screen
        let pupilLoginTitle = app.staticTexts["Pupil Login"]
        XCTAssertTrue(pupilLoginTitle.exists)
        
        // enter a valid pupil username
        /*
        let validUsername = "sasha"
        let pupilusernametextfieldTextField = app.textFields["pupilUserNameTextField"]
        XCTAssertTrue(pupilusernametextfieldTextField.exists)       // check the field exists
        pupilusernametextfieldTextField.tap()                       // double tap
        pupilusernametextfieldTextField.tap()
        pupilusernametextfieldTextField.typeText (validUsername)    // enter the username
        */
        
        // enter a valid password
        /*
        let validPassword = "brodie\n"
        let passwordtextfieldSecureTextField = app.secureTextFields["passwordTextField"]
        XCTAssertTrue(passwordtextfieldSecureTextField.exists)      // check the field exists
        passwordtextfieldSecureTextField.tap()                      // double tap
        passwordtextfieldSecureTextField.tap()
        passwordtextfieldSecureTextField.typeText(validPassword)    // enter a valid password

        */
        
        // press the Sign-In key
        //pupilusernametextfieldTextField.tap()  // workaround to get rid of keyboard
        app.buttons["SignInButton"].forceTapElement()
             
        //======
        
        // check the title exists
        let howFeeling = app/*@START_MENU_TOKEN@*/.staticTexts["HowAreYouFeeling"]/*[[".otherElements[\"moodPopupLabel\"].staticTexts[\"HowAreYouFeeling\"]",".staticTexts[\"HowAreYouFeeling\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(howFeeling.exists)

        // check each of the mood buttons exist and can be clicked
        let happy = app/*@START_MENU_TOKEN@*/.buttons["HappyButton"]/*[[".otherElements[\"moodPopupLabel\"].buttons[\"HappyButton\"]",".buttons[\"HappyButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(happy.exists)
        happy.tap()
        let ok = app/*@START_MENU_TOKEN@*/.buttons["OkButton"]/*[[".otherElements[\"moodPopupLabel\"].buttons[\"OkButton\"]",".buttons[\"OkButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(ok.exists)
        ok.tap()
        let sad = app/*@START_MENU_TOKEN@*/.buttons["SadButton"]/*[[".otherElements[\"moodPopupLabel\"].buttons[\"SadButton\"]",".buttons[\"SadButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(sad.exists)
        sad.tap()

        // check Like to talk field exists
        let likeTalk = app/*@START_MENU_TOKEN@*/.staticTexts["WouldYouLikeToTalk"]/*[[".otherElements[\"moodPopupLabel\"].staticTexts[\"WouldYouLikeToTalk\"]",".staticTexts[\"WouldYouLikeToTalk\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(likeTalk.exists)

        // check the mood text field
        let moodText = app/*@START_MENU_TOKEN@*/.textFields["moodTextField"]/*[[".otherElements[\"moodPopupLabel\"].textFields[\"moodTextField\"]",".textFields[\"moodTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(moodText.exists)
        let mood = "I would like to complete all my math test today"
        moodText.tap()
        moodText.typeText(mood)
        
        //check submit exists and press
        let submit = app/*@START_MENU_TOKEN@*/.staticTexts["Submit"]/*[[".otherElements[\"moodPopupLabel\"]",".buttons[\"SubmitButton\"].staticTexts[\"Submit\"]",".staticTexts[\"Submit\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(submit.exists)
        submit.tap()
        
        //check that moved to the main screen and notification popup
        let unreadNotificationPopup = app.staticTexts["UnreadNotificationsLabel"]
        unreadNotificationPopup.tap()
        //XCTAssertTrue(unreadNotificationPopup.exists)
        
    } //testMoodPopupScreen
    
    // ensure user can press X to cancel popup
    func testMoodPopupCancel() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // move to pupil login screen
        let pupilLogin = app/*@START_MENU_TOKEN@*/.staticTexts["Pupil Login"]/*[[".buttons[\"Pupil Login\"].staticTexts[\"Pupil Login\"]",".staticTexts[\"Pupil Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        pupilLogin.tap()  //press the pupil login button
        app.buttons["SignInButton"].forceTapElement()
                                
        // press the dismiss button
        let dismissButton = app/*@START_MENU_TOKEN@*/.buttons["DismissButton"]/*[[".otherElements[\"moodPopupLabel\"].buttons[\"DismissButton\"]",".buttons[\"DismissButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        dismissButton.tap();
        
        //check that moved to the main screen and notification popup
        let unreadNotificationPopup = app.staticTexts["UnreadNotificationsLabel"]
        unreadNotificationPopup.tap()

    } //testMoodPopupCancel
 

}

/*
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
 */
