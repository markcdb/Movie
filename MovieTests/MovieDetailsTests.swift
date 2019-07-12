//
//  MovieDetailsTests.swift
//  MovieTests
//
//  Created by Mark Christian Buot on 11/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import XCTest
@testable import Movie

class MovieDetailsTests: XCTestCase {

    var viewModel: MovieDetailsViewModel?
    var api: MockMovieRepository?
    var expectation: XCTestExpectation?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        api         = MockMovieRepository()
        viewModel   = GlobalVMFactory.createMovieDetailsVM(repository: api,
                                                           delegate: self)
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRequest() {
        self.expectation = XCTestExpectation(description: "")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            
            self.viewModel?.id = Strings.mockId
            self.viewModel?.request()
        }
        
        self.wait(for: [self.expectation!],
                  timeout: 10.0)
    }
}

extension MovieDetailsTests: BaseVMDelegate {
    
    func didUpdateModel(_ viewModel: BaseVM,
                        withState viewState: ViewState) {
        
        if viewState == .success(nil) {
            expectation?.fulfill()
        }
    }
}
