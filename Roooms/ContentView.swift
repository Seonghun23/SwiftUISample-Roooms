//
//  ContentView.swift
//  Roooms
//
//  Created by Seonghun Kim on 2020/06/07.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    var rooms: [Room] = []
    @ObservedObject var store = RoomStore()
    // 영상에서는 ObjectBinding으로 나오지만 지금은 deprecated
    
    var body: some View {
        
        NavigationView {
            List {
                 // command + click 후 HStack 이나 VStack을 상위 계층에 추가할 수도 있고 List로 변경할 수 있다.
                Section {
                    Button(action: addRoom) {
                        Text("Add Room")
                    }
                }
                // Section을 이용하여 분리할 수 있다.
                
                Section {
                    ForEach(store.rooms) { room in
                        RoomCell(room: room)
                    }
                    // List에 인자로 모델을 주게되면 하나의 리스트만 존재하게 된다. 그래서 여기서 ForEach를 이용하여 아래에 목록을 추가하였다.
                    
                    .onDelete(perform: delete)
                    // 셀에 삭제 속성 부여
                    
                    .onMove(perform: move)
                    // 셀에 이동 가능하게 변경
                }
                
                // command + click 후 Extract Subviews를 선택하여 뷰를 Subview로 분리할 수 있다.
            }
            .navigationBarTitle(Text("Rooms"))
            .navigationBarItems(trailing: EditButton())
            // EditButton을 추가하면 해당 버튼은 자동으로 편집모드 변경 기능을 가진다.
                
            .listStyle(GroupedListStyle())
            // 영상에서는 listStyle(.grouped)로 작성할 수 있는데 지금은 안된다...  왜지?
        }
    }
    
    func addRoom() {
        store.rooms.append(Room(name: "Hall 2", capacity: 2000))
    }
    
    func delete(at offsets: IndexSet) {
        store.rooms.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        store.rooms.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: RoomStore(rooms: testData))
            
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.colorScheme, .dark)
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.layoutDirection, .rightToLeft)
                .environment(\.locale, Locale(identifier: "ar"))
                // Preview에 환경을 설정하여 볼 수 있다
                // 다국어를 지원하면 Text에 글자를 직접 변경할 필요 없이 자동으로 적용되는 듯 하다.
        }
        
    }
}
// 이전과 다르게 PreviewProvider를 #if DEBUG와 #endif로 감싸지 않았다. 괜찮은 건지 모르겠다.

struct RoomCell: View {
    let room: Room
    
    var body: some View {
        NavigationLink(destination: RoomDetail(room: room)) {
            //                NavigationButton(destination: Text(room.name)) {
            // 영상에선 이렇게 나오는데 안먹힌다. 바뀐 NavigationLink로 하자
            
            Image(systemName: "photo")
                // 데모 이미지 없어서 변경 안함 Image(room.imageName)로 변경하면 각 셀에 이미지를 적용할 수 있다.
                // 셀 높이는 이미지에 따라 자동으로 적용된다.
                .cornerRadius(8)
            // Preview에 Modifier를 이미지에 Drag & Drop으로 적용할 수있다.
            
            VStack(alignment: .leading) {
                // 코드에서 추가하든 Preview에서 추가하든 다른 한쪽에 자동으로 적용되어 표시된다.
                Text(room.name)
                Text("\(room.capacity) people")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
