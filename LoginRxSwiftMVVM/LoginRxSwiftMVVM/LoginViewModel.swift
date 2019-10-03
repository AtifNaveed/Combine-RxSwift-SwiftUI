//
//  LoginViewModel.swift
//  LoginRxSwiftMVVMsd
//
//  Created by Atif on 06/08/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

struct LoginViewModel {
    var email = BehaviorRelay(value: "")
    var password = BehaviorRelay(value: "")
    var isValid: Observable<Bool> {
        return Observable.combineLatest(email.asObservable(), password.asObservable()) { email, password in
            email.isValidEmail() && password.isValidPassword()
        }
    }
}
