import SwiftUI
import Observation

@Observable
final class TabBarCoordinator {

    enum Tab: Int, CaseIterable, Identifiable {

        case home
        case worship
        case prayer
        case community
        case settings

        var id: Int { rawValue }

        var title: String {

            switch self {

            case .home:
                return "홈"

            case .worship:
                return "예배"

            case .prayer:
                return "기도"

            case .community:
                return "공동체"

            case .settings:
                return "설정"

            }

        }

        var systemImage: String {

            switch self {

            case .home:
                return "house.fill"

            case .worship:
                return "church"

            case .prayer:
                return "hands.sparkles.fill"

            case .community:
                return "person.3.fill"

            case .settings:
                return "gearshape.fill"

            }

        }

    }

    var selectedTab: Tab = .home

    func select(_ tab: Tab) {

        guard selectedTab != tab else {

            return

        }

        withAnimation(.snappy(duration: 0.32)) {

            selectedTab = tab

        }

    }

}