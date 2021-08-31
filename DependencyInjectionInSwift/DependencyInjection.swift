//
//  TightlyCoupledExample.swift
//  DependencyInjectionInSwift
//
//  Created by Elif Korkmaz on 31.08.2021.
//

import Foundation

protocol SignIn {
    func signIn()
}

class SignInWithGoogle: SignIn {
    func signIn() {
        print("Signed in with Google")
    }
}

class SignInWithApple: SignIn {
    func signIn() {
        print("Signed in with Apple")
    }
}


//bad example
class SignInTightlyCoupled {
    
    private let signInMethod: SignIn
    
    init() {
        self.signInMethod = SignInWithGoogle()
    }
    
    func makeUserSignIn() {
        signInMethod.signIn()
    }
}

//MARK: - Initializer Injection

//good example
class SignInLooselyCoupled {
    
    private let signInMethod: SignIn
    
    init(signInMethod: SignIn) {
        self.signInMethod = signInMethod
    }
    
    func makeUserSignIn() {
        signInMethod.signIn()
    }
}


let signInMethod = SignInWithApple()
let signIn = SignInLooselyCoupled(signInMethod: signInMethod)

//MARK: - Property Injection

/*
class SignInLooselyCoupled {
    
    var signInMethod: SignIn?
    
    func makeUserSignIn() {
        signInMethod?.signIn()
    }
}

class PropertyInjectionExample {
    
    var signIn = SignInLooselyCoupled()
    
    func makeUserSignIn() {
        signIn.signInMethod = SignInWithApple()
    }
}
*/

//MARK: - Method Injection

/*

class SignInLooselyCoupled {
    func makeUserSignIn(signInMethod: SignIn) {
        //...
    }
}

class MethodInjectionExample {
    
    var signIn = SignInLooselyCoupled()
    
    func makeUserSignIn() {
        signIn.makeUserSignIn(signInMethod: SignInWithGoogle())
    }
}
*/
