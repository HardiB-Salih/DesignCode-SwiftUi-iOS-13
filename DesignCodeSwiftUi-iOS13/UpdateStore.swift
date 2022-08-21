//
//  UpdateStore.swift
//  DesignCodeSwiftUi-iOS13
//
//  Created by HardiBSalih on 21.08.2022.
//

import Foundation
import Combine

class UpdateStore : ObservableObject {
    @Published var updates : [Update] = updateData
}
