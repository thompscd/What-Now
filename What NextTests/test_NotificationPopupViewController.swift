//
//  test_NotificationPopupViewController.swift
//  What NextTests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest
@testable import What_Next

//test cases for NotificationPopupViewController.swift

let vc_NotificationPopupViewController = NotificatonPopupViewController ();

class test_NotificationPopupViewController: XCTestCase {
    
    // test function to extract notifications from the database
    func test_extractNotifications () throws {
        //add 4 notifications to the database
        let random_num = Int.random(in: 1...1000)
        GlobalVar.loginname = "testteacherlogin"+String(random_num)
        let pupilloginname : String = "testpupil"
        let notification : String = "test notification"
        let priority : Int = 3
        vc_TeacherNotificationViewController.insertNotificationIntoDB (pupil : pupilloginname, notification : notification, priority : priority)
        vc_TeacherNotificationViewController.insertNotificationIntoDB (pupil : pupilloginname, notification : notification, priority : priority)
        vc_TeacherNotificationViewController.insertNotificationIntoDB (pupil : pupilloginname, notification : notification, priority : priority)
        vc_TeacherNotificationViewController.insertNotificationIntoDB (pupil : pupilloginname, notification : notification, priority : priority)

        
        // ensure 4 notifications can be extracted from db
        
        let querySQL = "SELECT pupilloginname, notification, priority FROM NOTIFICATIONS WHERE teacherloginname = '\(GlobalVar.loginname)';"
        let results = GlobalVar.whatNextDB.executeQuery(querySQL, withArgumentsIn:[])! ;
        var notification_count : Int = 0;
        while results.next() == true {
            notification_count += 1;
        }

        // check 4 notifications extracted from database
        XCTAssertTrue(notification_count == 4) ;

    } //test_insertNotificationIntoDB
}
