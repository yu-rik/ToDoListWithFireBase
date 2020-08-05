//
//  Task.swift
//  ToDoListWithFireBase
//
//  Created by yurik on 8/5/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import Foundation
import Firebase

struct  Task {
    let title: String
    let personId: String
    let ref: DatabaseReference?
    var completed: Bool = false
    
    //инициализатор для создпния объекта лдокальнл
    init (title: String, userId: String) {
        self.title = title
        self.personId = userId
        self.ref = nil
    }
     //инициализатор для извлечения объекта из базы данных
    init(snapshot: DataSnapshot) {
        let snapShotValue = snapshot.value as! [String: AnyObject]
        title = snapShotValue["title"] as! String
        personId = snapShotValue["personId"] as! String
        completed = snapShotValue["completed"] as! Bool
        ref = snapshot.ref
    }
}
