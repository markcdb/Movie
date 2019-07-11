//
//  BaseVM.swift
//  FourSquare
//
//  Created by Mark Christian Buot on 31/01/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol BaseVMDelegate: class {
    
    func didUpdateModel(_ viewModel: BaseVM,
                        withState viewState: ViewState)
}

class BaseVM {
    
    open var disposeBag: DisposeBag = DisposeBag()
    
    open var viewState: BehaviorRelay<ViewState?>? {
        didSet {
            if let state = viewState?.value {
                delegate?.didUpdateModel(self,
                                         withState: state)
            }
        }
    }
    
    open weak var delegate: BaseVMDelegate?
    
    init(delegate: BaseVMDelegate) {
        self.delegate = delegate
    }
    
    internal func startBinding() {
        viewState?.bind(onNext: {[weak self] viewState in
            guard let self = self else { return }
            
            if let state = viewState {
                self.delegate?.didUpdateModel(self, withState: state)
            }
        }).disposed(by: disposeBag)
    }
}
