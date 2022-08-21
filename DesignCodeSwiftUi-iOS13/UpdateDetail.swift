//
//  UpdateDetail.swift
//  DesignCodeSwiftUi-iOS13
//
//  Created by HardiBSalih on 21.08.2022.
//

import SwiftUI

struct UpdateDetail: View {
    var update: Update = updateData[1]
    var body: some View {
        List {
            VStack {
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationTitle(update.title)
        }
        .listStyle(GroupedListStyle())
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
