//
//  test_TeacherSettingsViewController.swift
//  What NextTests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest
@testable import What_Next

//test cases for TeacherSettingsViewController.swift

let vc_TeacherSettings = TeacherSettingsViewController ();

class test_TeacherSettingsViewController: XCTestCase {
    
    // test function that validates email format
    func test_isValidEmail () throws {
                
        var emailStr : String = ""
        
        // invalid formats
        emailStr="bob"
        XCTAssertFalse(emailStr.isValidEmail) ;
        emailStr=""
        XCTAssertFalse(emailStr.isValidEmail) ;
        emailStr="bob@"
        XCTAssertFalse(emailStr.isValidEmail) ;
        emailStr="bob@@hello.com"
        XCTAssertFalse(emailStr.isValidEmail) ;
        emailStr="bob@hello.com@hello"
        XCTAssertFalse(emailStr.isValidEmail) ;
        
        // valid formats
        emailStr="bob@hello.com"
        XCTAssertTrue(emailStr.isValidEmail) ;
        emailStr="bob@hello.co.uk"
        XCTAssertTrue(emailStr.isValidEmail) ;
        emailStr="bob@hello.edu"
        XCTAssertTrue(emailStr.isValidEmail) ;
        emailStr="bob_2@hello.com"
        XCTAssertTrue(emailStr.isValidEmail) ;
        
    } //test_isValidEmail
    
}
