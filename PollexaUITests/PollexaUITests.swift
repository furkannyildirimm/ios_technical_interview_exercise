//
//  PollexaUITests.swift
//  PollexaUITests
//
//  Created by Furkan Yıldırım on 20.05.2024.
//

import XCTest

final class PollexaUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("---UITest---")
    }
    
    func testProfileButton() throws {
        
        app.launch()
        XCUIApplication().navigationBars["Pollexa.DiscoverView"].buttons["userImage"].tap()
    }

    func testAddButton() throws {
        
        app.launch()
        XCUIApplication().navigationBars["Pollexa.DiscoverView"].buttons["Add"].tap()

    }
    func testSwipe() throws {
        
        app.launch()
        XCUIApplication().tables.cells.containing(.staticText, identifier:"Which dessert should I serve at my party?").staticTexts["0 Total Votes"].swipeUp()
    }
    
    func testVotingButton() throws {
        
        app.launch()
        XCUIApplication().tables.cells.containing(.staticText, identifier:"Which car should I buy for my next vehicle?").children(matching: .button).element(boundBy: 1).tap()

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
