import SwiftUI

extension View {
  /// Le but de cet helper est de simplifier l'utilisation du geometry reader
  /// - Parameter onChange: what to do on size update
  func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
    background(
      GeometryReader { geometryProxy in
        Color.clear
          .preference(key: ReadSizePreferenceKey.self, value: geometryProxy.size)
      }
    )
    .onPreferenceChange(ReadSizePreferenceKey.self, perform: onChange)
  }
}

struct ReadSizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  
  static func reduce(value _: inout CGSize, nextValue _: () -> CGSize) {}
}
