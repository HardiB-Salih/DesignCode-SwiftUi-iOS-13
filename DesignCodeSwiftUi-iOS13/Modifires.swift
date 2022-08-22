//
//  Modifires.swift
//  DesignCodeSwiftUi-iOS13
//
//  Created by HardiBSalih on 22.08.2022.
//

import SwiftUI

struct ShadowModifires: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}


struct FontModifire : ViewModifier {
    
    var style : Font.TextStyle  = .body
    func body(content: Content) -> some View {
        content
            .font(.system(style, design: .default))
    }
}



struct CustomFontModifire: ViewModifier {
    var size : CGFloat = 20
    
    func body(content: Content) -> some View {
        content
            .font(.custom("WorkSans-Bold", size: size))
    }
}


enum CustomFont : String {
    case black = "WorkSans-Black"
    case bold = "WorkSans-Bold"
    case semiBold = "WorkSans-SemiBold"
    case medium = "WorkSans-Medium"
    case light = "WorkSans-Light"
    case regular = "WorkSans-Regular"
}
