//
//  Rooms.swift
//  Roooms
//
//  Created by Seonghun Kim on 2020/06/07.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import SwiftUI

struct Room: Identifiable {
    // SwiftUI의 List에서 이 모델을 사용학 위해선 Identifiable을 준수해야 한다.
    var id = UUID()
    var name: String
    var capacity: Int
    var hasVideo: Bool = false
    
    var imageName: String { return name }
    var thumbnailName: String { return name + "Thumb" }
}

#if DEBUG
let testData = [
    Room(name: "Obseration Deck1", capacity: 6, hasVideo: true),
    Room(name: "Obseration Deck2", capacity: 8, hasVideo: false),
    Room(name: "Obseration Deck3", capacity: 16, hasVideo: true),
    Room(name: "Obseration Deck4", capacity: 10, hasVideo: true),
    Room(name: "Obseration Deck5", capacity: 12, hasVideo: false),
    Room(name: "Obseration Deck6", capacity: 8, hasVideo: false),
    Room(name: "Obseration Deck7", capacity: 10, hasVideo: true),
    Room(name: "Obseration Deck8", capacity: 7, hasVideo: false),
    Room(name: "Obseration Deck9", capacity: 1, hasVideo: false)
]
#endif
