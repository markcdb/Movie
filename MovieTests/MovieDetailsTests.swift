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
    var api: MovieDetailsRepository?
    var expectation: XCTestExpectation?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        api         = MovieDetailsRepository()
        viewModel   = GlobalVMFactory.createMovieDetailsVM(repository: api,
                                                           delegate: self)
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRequest() {
        self.expectation = XCTestExpectation(description: "")

        let listVM = GlobalVMFactory.createMovieListVM(delegate: nil)
        listVM.request()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            
            let id = listVM.movies.first?.id ?? 0
            self.viewModel?.id = id
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
