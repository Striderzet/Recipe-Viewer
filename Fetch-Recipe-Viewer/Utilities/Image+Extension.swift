//
//  Image+Extension.swift
//  Fetch-Recipe-Viewer
//
//  Created by Tony Buckner on 11/4/24.
//

import Foundation
import SwiftUI
import UIKit

// MARK: SwiftUI Image Extension
extension Image {
    @MainActor
    func getUIImage() -> UIImage? {
        let image = resizable()
            .scaledToFill()
            .clipped()
        return ImageRenderer(content: image).uiImage
    }
}
