//
//  RoomDetail.swift
//  Roooms
//
//  Created by Seonghun Kim on 2020/06/07.
//  Copyright © 2020 Seonghun Kim. All rights reserved.
//

import SwiftUI

struct RoomDetail: View {
    let room: Room
    @State private var zoomed = false
    // State 프로퍼티의 값을 변경하면 연결된 UI에 적용된다.
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(systemName: "studentdesk")
            .resizable()
            .aspectRatio(contentMode: zoomed ? .fill : .fit)
            // Preview에 Modifier를 직접 Drag & Drop하여 속성을 추가할 수 있다.
            .onTapGesture {
                // 영상에서는 tapAction 으로 나오지만 이후 변경된 듯 하다.
                
                withAnimation(.linear(duration: 2)) { self.zoomed.toggle() }
                // withAnimation 함수로 감싸주기만 하면 애니메이션이 적용된다.
                // 변경된 상태에 대해 자동으로 추적하여 적용하므로 연속된 값의 변경에도 최신값을 기준으로 변경되어 적용되므로 버그가 발생할 확률이 낮다.
                
                // 영상에서는 Animation을 basic으로 설정하지만 지금은 없다. default가 있긴 하지만 duration을 따로 받지 않는다. 그래서 동일할 것으로 생각되는 linear로 설정하였다. 다른 타입의 애니메이션이 필요하면 그것에 맞춰 변경할 수 있다.
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)

            if room.hasVideo && !zoomed {
            // 조건문을 통하여 간단하게 UI를 분기처리 할 수 있다.
                Image(systemName: "video.fill")
                    .font(.title)
                    .padding(.all)
                    .transition(.move(edge: .leading))
            }
        }
        .navigationBarTitle(Text(room.name), displayMode: .inline)
        // 해당 View에 navigationBarTitle을 설정할 수 있다.
    }
}

struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
        // Group을 이용하면 여러 설정값에 대한 Preview를 동시에 볼 수 있다.
            
            NavigationView { RoomDetail(room: testData[0]) }
            // 이 View는 이전에 View의 NavigationView를 공유하는 상태이므로 Preview에서 기대하는 동작대로 보기 위해, NavigationView로 감싸서 확인해 볼 수 있다.
            NavigationView { RoomDetail(room: testData[1]) }
        }
        
    }
}
