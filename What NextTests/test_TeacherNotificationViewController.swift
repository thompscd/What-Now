//
//  test_TeacherNotificationViewController.swift
//  What NextTests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest
@testable import What_Next

//test cases for TeacherNotificationViewController.swift

let vc_TeacherNotificationViewController = TeacherNotificationViewController ();

class test_TeacherNotificationViewController: XCTestCase {
    
    // test function to add notification to the database
    func test_insertNotificationIntoDB () throws {
        //add a notification to the database
        GlobalVar.loginname = "testteacherlogin"
        let pupilloginname : String = "testpupil"
        let notification : String = "test notification"
        let priority : Int = 3
        vc_TeacherNotificationViewController.insertNotificationIntoDB (pupil : pupilloginname, notification : notification, priority : priority)
        
        // ensure it can be extracted from db
        
        let querySQL = "SELECT pupilloginname, notification, priority FROM NOTIFICATIONS WHERE teacherloginname = '\(GlobalVar.loginname)';"
        let results = GlobalVar.whatNextDB.executeQuery(querySQL, withArgumentsIn:[])! ;
        results.next() // get the test notification that was added
        let db_pupil : String = results.string(forColumn:"pupilloginname") ?? ""
        let db_notification : String = results.string(forColumn:"notification") ?? ""
        let db_priority : Int = results.long(forColumn:"priority")

        // valid extraction attempt
        XCTAssertTrue(db_pupil == pupilloginname) ;
        XCTAssertTrue(db_notification == notification) ;
        XCTAssertTrue(db_priority == priority) ;

    } //test_insertNotificationIntoDB
}
