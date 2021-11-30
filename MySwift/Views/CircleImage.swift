//
//  CircleImage.swift
//  MySwift
//
//  Created by origin on 2021/11/26.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleImage(image: Image("turtlerock"))
        }
    }
}
