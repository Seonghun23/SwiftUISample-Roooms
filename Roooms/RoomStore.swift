//
//  RoomStore.swift
//  Roooms
//
//  Created by Seonghun Kim on 2020/06/07.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import SwiftUI
import Combine

class RoomStore: ObservableObject {
    // 영상에서는 BindableObject로 나오지만 지금은 deprecated 되었다.
    
//    var rooms: [Room] {
//        didSet { didChange.send() }
//    }
//    var didChange = PassthroughSubject<Void, Never>()
    // 영상에선 요걸 세트로 해서 업데이트 하지만 동작 안한다. 
    
    @Published var rooms: [Room]
    // 그래서 이걸로 바꾸니 동작한다.
    
    init(rooms: [Room] = []) {
        self.rooms = rooms
    }
    
    
}
