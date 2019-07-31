//
//  MarvelListViewControllerTest.swift
//  MarvelAppUITests
//
//  Created by Renato Matos de Paula on 25/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import SDK

@testable import MarvelApp

class MarvelListViewControllerTest: QuickSpec {
    override func spec() {
        var sut: UINavigationController!
        
        beforeEach {
            sut = ((UIApplication.shared.delegate as! AppDelegate).window!.rootViewController as! UINavigationController)
        }
        
        context("when present MainViewController in window") {
            it("should to have a valid snapshot") {
                self.viewTester.waitForAnimationsToFinish()
                expect(sut) == snapshot("HeroesListViewController")
            }
        }
        
        context("when present MainViewController and select a character") {
            it("should to present heroe detail screen") {
                self.viewTester.usingIdentifier("HEROE_CELL_0")?.tap()
                self.viewTester.usingIdentifier("DETAIL_SCREEN_VIEW")?.waitForView()
            }
        }
    }
}
