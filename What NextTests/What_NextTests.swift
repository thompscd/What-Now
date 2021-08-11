//
//  What_NextTests.swift
//  What NextTests
//
//  Created by Chris Thompson on 03/07/2021.
//

import XCTest
@testable import What_Next

//test cases for ViewController.swift

let vc = ViewController ();

class testViewControllerClass: XCTestCase {
    
    func test_createDatabase () throws {
                
        // test that the database can be opened without failure
        vc.createDatabase ();  // create the database
        let databaseOpen = GlobalVar.whatNextDB != nil;
        XCTAssertTrue(databaseOpen) ; // test if it exists
    
        // check if each of the tables have been created
        let checkPupilTable = "SELECT count(*) FROM sqlite_master WHERE type='table' AND name='PUPIL';"
        let results = GlobalVar.whatNextDB.executeQuery(checkPupilTable, withArgumentsIn:[])!;
        XCTAssertTrue(results.next()) ; // test if it exists
        
        let checkTeacherTable = "SELECT count(*) FROM sqlite_master WHERE type='table' AND name='TEACHER';"
        let results2 = GlobalVar.whatNextDB.executeQuery(checkTeacherTable, withArgumentsIn:[])!;
        XCTAssertTrue(results2.next()) ; // test if it exists
        
        let checkCommentsTable = "SELECT count(*) FROM sqlite_master WHERE type='table' AND name='COMMENTS';"
        let results3 = GlobalVar.whatNextDB.executeQuery(checkCommentsTable, withArgumentsIn:[])!;
        XCTAssertTrue(results3.next()) ; // test if it exists
        
        let checkNotificationsTable = "SELECT count(*) FROM sqlite_master WHERE type='table' AND name='NOTIFICATIONS';"
        let results4 = GlobalVar.whatNextDB.executeQuery(checkNotificationsTable, withArgumentsIn:[])!;
        XCTAssertTrue(results4.next()) ; // test if it exists
        
    } //test_createDatabase
    
    
    // test that the TEACHER table can be populated
    func test_populateTeacherTable () throws {
        vc.populateTeacherTable()
        let TeacherTable="SELECT firstname FROM TEACHER"
        let teacherResult = GlobalVar.whatNextDB.executeQuery( TeacherTable, withArgumentsIn:[])!;
        var count = 0;
        while (teacherResult.next()==true) {
            count += 1;
        }
        XCTAssertTrue(count==2) ; // should have been 2 teacher records added
    } // test_populateTeacherTable
    
    
    // test that the PUPIL table can be populated
    func test_populatePupilTable () throws {
                
        vc.populatePupilTable();  // populate the PUPIL table
        let PupilTable = "SELECT * FROM PUPIL ;"
        let results5:FMResultSet? = GlobalVar.whatNextDB.executeQuery(PupilTable, withArgumentsIn:[]);
        var count = 0;
        while (results5?.next()==true) {
            count += 1;
        }
        XCTAssertTrue(count==3) ; // should have been 3 pupil records added
        
    } //test_populatePupilTable
    
    // test that the COMMENTS table can be populated
    func test_populateCommentTable () throws {
                
        // populateCommentsTable called by viewDidLoad when vc class variable declared above
        //vc.populateCommentsTable();  // populate the COMMENTS table
        let CommentsTable = "SELECT * FROM COMMENTS ;"
        let results5:FMResultSet? = GlobalVar.whatNextDB.executeQuery(CommentsTable, withArgumentsIn:[]);
        var count = 0;
        while (results5?.next()==true) {
            count += 1;
        }
        XCTAssertTrue(count==2) ; // should have been 2 comments records added
        
    } //test_populateCommentsTable
    
    // test that the NOTIFICATIONS table can be populated
    func test_populateNotificationsTable () throws {
             
        // populateNotification called by viewDidLoad when vc class variable declared above
        //vc.populateNotificationsTable();  // populate the NOTIFICATIONS table
        let NotificationsTable = "SELECT * FROM NOTIFICATIONS ;"
        let results6:FMResultSet? = GlobalVar.whatNextDB.executeQuery(NotificationsTable, withArgumentsIn:[]);
        var count = 0;
        while (results6?.next()==true) {
            count += 1;
        }
        XCTAssertTrue(count==3) ; // should have been 3 notifications records added
        
    } //test_populateNotificationsTable
    
}
