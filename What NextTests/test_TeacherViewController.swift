//
//  test_TeacherViewController.swift
//  What NextTests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest
@testable import What_Next

//test cases for TeacherViewController.swift

let vc_TeacherViewController = TeacherViewController ();

class test_TeacherViewController: XCTestCase {
    
    // test function to read pupil details from database
    func test_extractPupilDetailsfromDB () throws {
          
        //add a test pupil to the database
        let loginname : String = "stuarts"
        let firstname : String = "Stuart"
        let surname : String = "Smith"
        let password : String = "heaven"
        let insertPupilSQL1 = "INSERT INTO PUPIL (loginname, firstname, lastname, lastlogin, password) VALUES ('\(loginname)','\(firstname)','\(surname)','4 July 2021 8:24','\(password)');"
        let result1 = GlobalVar.whatNextDB.executeUpdate(insertPupilSQL1,withArgumentsIn: [] );

        // valid extraction attempt
        let pupil1 = vc_PupilSettingsViewController.extractPupilDetailsfromDB (loginname: loginname);
        XCTAssertTrue(pupil1.found) ;
        XCTAssertTrue(pupil1.firstname==firstname) ;
        XCTAssertTrue(pupil1.lastname==surname) ;
        XCTAssertTrue(pupil1.password==password) ;

        // invalid extraction attempt
        let pupil2 = vc_PupilSettingsViewController.extractPupilDetailsfromDB (loginname: "test");
        XCTAssertFalse(pupil2.found) ;

    } //test_extractPupilDetailsfromDB
    
}
