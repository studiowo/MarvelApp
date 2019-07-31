//
//  HeroesRouterTest.swift
//  MarvelAppTests
//
//  Created by Renato Matos de Paula on 31/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Quick
import Nimble
import Alamofire

@testable import MarvelApp

class HeroesRouterTest: QuickSpec {
    override func spec() {
        var sut: HeroesRouter!
        
        beforeEach {
            sut = .list
        }
        
        context("when get HeroesRouter values") {
            it("needsAuth should to be true") {
                expect(sut.needsAuth).to(beTrue())
            }
            it("method should to be get") {
                expect(sut.method).to(equal(.get))
            }
            it("path should to be characters") {
                expect(sut.path).to(equal("characters"))
            }
            it("parameters should to nil") {
                expect(sut.parameters).to(beNil())
            }
            it("headers should not to be nil") {
                expect(sut.headers).notTo(beNil())
            }
            it("parameterEncoding should to be URLEncoding") {
                expect(sut.parameterEncoding).to(beAnInstanceOf(URLEncoding.self))
            }
        }
    }
}
