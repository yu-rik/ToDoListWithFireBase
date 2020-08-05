//
//  User.swift
//  ToDoListWithFireBase
//
//  Created by yurik on 8/5/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import Foundation
import Firebase

struct Person {
    let uid: String
    let email: String
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email!
    }
}


