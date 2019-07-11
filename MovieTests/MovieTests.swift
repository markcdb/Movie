//
//  MovieTests.swift
//  MovieTests
//
//  Created by Mark Christian Buot on 10/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import XCTest
@testable import Movie

class MovieTests: XCTestCase {

    
    var expectation: XCTestExpectation?
    var viewModel: MovieListViewModel?
    var api: MovieRepository?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = GlobalVMFactory.createMovieListVM(delegate: self)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testListRequest() {
        expectation = XCTestExpectation(description: "")
        viewModel?.request()
        
        wait(for: [expectation!],
             timeout: 10.0)
    }
}

extension MovieTests: BaseVMDelegate {
    
    func didUpdateModel(_ viewModel: BaseVM,
                        withState viewState: ViewState) {
        if viewState == .success(nil) {
            expectation?.fulfill()
        }
    }
}
