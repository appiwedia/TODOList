//
//  Task.swift
//  TODOList
//
//  Created by Mickael Mas on 21/02/2020.
//  Copyright © 2020 APPIWEDIA. All rights reserved.
//

import Foundation

struct Task: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var selected: Bool = false
}
