import SwiftUI

// MARK: - Navigation Components

public typealias NavigationBar = LiquidNavigationBar
public typealias TabBar = LiquidTapBar
public typealias FloatingTabBar = FloatingGlassTapBar

// MARK: - Navigation System

public typealias NavigationCoordinator = Core.NavigationCoordinator
public typealias AppRoute = Core.AppRoute
public typealias PresentationStyle = Core.PresentationStyle
public typealias NavigationTransition = Core.NavigationTransition

// MARK: - Route Management

public typealias RouteParameter = Core.RouteParameter
public typealias RouteType = Core.RouteType
public typealias RouteDestination = Core.RouteDestination
public typealias DeepLinkRoute = Core.DeepLinkRoute
public typealias DeepLinkHandler = Core.DeepLinkHandler

// MARK: - Coordinators

public typealias StackCoordinator = Core.StackCoordinator
public typealias ModalCoordinator = Core.ModalCoordinator
public typealias TabBarCoordinator = Core.TabBarCoordinator
public typealias SheetCoordinator = Core.SheetCoordinator
public typealias FullScreenCoverCoordinator = Core.FullScreenCoverCoordinator
public typealias DialogCoordinator = Core.DialogCoordinator
public typealias AlertCoordinator = Core.AlertCoordinator
public typealias ConfirmationDialogCoordinator = Core.ConfirmationDialogCoordinator
public typealias BottomSheetCoordinator = Core.BottomSheetCoordinator
public typealias ModalPresentationController = Core.ModalPresentationController

// MARK: - Transitions & Animations

public typealias AppleTransitionModifier = Core.AppleTransitionModifier
public typealias ModalPresentationStyle = Core.ModalPresentationStyle
public typealias InteractiveDismissGesture = Core.InteractiveDismissGesture
public typealias NavigationTransitionModifier = Core.NavigationTransitionModifier
public typealias AppleAnimationManager = Core.AppleAnimationManager

// MARK: - Navigation Bar

public typealias NavigationBarAppearanceManager = Core.NavigationBarAppearanceManager
public typealias LargeTitleSynchronizer = Core.LargeTitleSynchronizer
public typealias LargeTitleView = Core.LargeTitleView

// MARK: - Gestures

public typealias BackSwipeGestureModifier = Core.BackSwipeGestureModifier
public typealias InteractiveGestureSupport = Core.InteractiveGestureSupport
public typealias InteractiveDismissModifier = Core.InteractiveDismissModifier

// MARK: - Advanced Routing

public typealias DeepLinkRouter = Core.DeepLinkRouter
public typealias WidgetRouteHandler = Core.WidgetRouteHandler
public typealias WidgetRegistry = Core.WidgetRegistry
public typealias LiveActivityRouteHandler = Core.LiveActivityRouteHandler
public typealias LiveActivityRegistry = Core.LiveActivityRegistry
public typealias SiriShortcutHandler = Core.SiriShortcutHandler
public typealias NotificationRouteHandler = Core.NotificationRouteHandler
public typealias UniversalLinkHandler = Core.UniversalLinkHandler

// MARK: - Accessibility

public typealias NavigationAccessibilityHelper = Core.NavigationAccessibilityHelper
public typealias NavigationPerformanceMonitor = Core.NavigationPerformanceMonitor

// MARK: - Feature Integration

public typealias FeatureNavigationContainer = Core.FeatureNavigationContainer
public typealias FeatureScreenView = Core.FeatureScreenView
public typealias FeatureNavigationStack = Core.FeatureNavigationStack

// MARK: - Containers

public typealias NavigationContainer = Core.NavigationContainer
public typealias AppNavigationView = Core.AppNavigationView
public typealias AppTabBar = Core.AppTabBar
