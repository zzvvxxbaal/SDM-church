import SwiftUI

public struct SheetCoordinator {
    @State private var isPresented = false
    @State private var sheetItem: AppRoute?
    
    public init() {}
    
    public mutating func present(_ route: AppRoute) {
        sheetItem = route
        isPresented = true
    }
    
    public mutating func dismiss() {
        isPresented = false
        sheetItem = nil
    }
}

public struct FullScreenCoverCoordinator {
    @State private var isPresented = false
    @State private var coverItem: AppRoute?
    
    public init() {}
    
    public mutating func present(_ route: AppRoute) {
        coverItem = route
        isPresented = true
    }
    
    public mutating func dismiss() {
        isPresented = false
        coverItem = nil
    }
}

public struct DialogCoordinator {
    @State private var isPresented = false
    @State private var title: String = ""
    @State private var message: String = ""
    @State private var primaryAction: (() -> Void)?
    @State private var secondaryAction: (() -> Void)?
    
    public init() {}
    
    public mutating func present(
        title: String,
        message: String,
        primaryAction: @escaping () -> Void = {},
        secondaryAction: @escaping () -> Void = {}
    ) {
        self.title = title
        self.message = message
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
        isPresented = true
    }
    
    public mutating func dismiss() {
        isPresented = false
    }
}

public struct AlertCoordinator {
    @State private var isPresented = false
    @State private var title: String = ""
    @State private var message: String = ""
    
    public init() {}
    
    public mutating func present(title: String, message: String) {
        self.title = title
        self.message = message
        isPresented = true
    }
    
    public mutating func dismiss() {
        isPresented = false
    }
}

public struct ConfirmationDialogCoordinator {
    @State private var isPresented = false
    @State private var title: String = ""
    @State private var message: String = ""
    @State private var actions: [ConfirmationAction] = []
    
    public struct ConfirmationAction {
        let label: String
        let role: DialogRole
        let action: () -> Void
        
        enum DialogRole {
            case destructive
            case cancel
            case default_
        }
    }
    
    public init() {}
    
    public mutating func present(
        title: String,
        message: String,
        actions: [ConfirmationAction]
    ) {
        self.title = title
        self.message = message
        self.actions = actions
        isPresented = true
    }
    
    public mutating func dismiss() {
        isPresented = false
    }
}

public struct BottomSheetCoordinator {
    @State private var isPresented = false
    @State private var detents: Set<PresentationDetent> = [.medium, .large]
    
    public init() {}
    
    public mutating func present(detents: Set<PresentationDetent> = [.medium, .large]) {
        self.detents = detents
        isPresented = true
    }
    
    public mutating func dismiss() {
        isPresented = false
    }
}

public struct ModalPresentationController {
    private var sheetCoordinator = SheetCoordinator()
    private var fullScreenCoordinator = FullScreenCoverCoordinator()
    private var dialogCoordinator = DialogCoordinator()
    private var alertCoordinator = AlertCoordinator()
    private var confirmationCoordinator = ConfirmationDialogCoordinator()
    private var bottomSheetCoordinator = BottomSheetCoordinator()
    
    public init() {}
    
    public mutating func presentSheet(_ route: AppRoute) {
        sheetCoordinator.present(route)
    }
    
    public mutating func dismissSheet() {
        sheetCoordinator.dismiss()
    }
    
    public mutating func presentFullScreen(_ route: AppRoute) {
        fullScreenCoordinator.present(route)
    }
    
    public mutating func dismissFullScreen() {
        fullScreenCoordinator.dismiss()
    }
    
    public mutating func presentDialog(
        title: String,
        message: String,
        primaryAction: @escaping () -> Void = {},
        secondaryAction: @escaping () -> Void = {}
    ) {
        dialogCoordinator.present(
            title: title,
            message: message,
            primaryAction: primaryAction,
            secondaryAction: secondaryAction
        )
    }
    
    public mutating func dismissDialog() {
        dialogCoordinator.dismiss()
    }
    
    public mutating func presentAlert(title: String, message: String) {
        alertCoordinator.present(title: title, message: message)
    }
    
    public mutating func dismissAlert() {
        alertCoordinator.dismiss()
    }
    
    public mutating func presentBottomSheet(
        detents: Set<PresentationDetent> = [.medium, .large]
    ) {
        bottomSheetCoordinator.present(detents: detents)
    }
    
    public mutating func dismissBottomSheet() {
        bottomSheetCoordinator.dismiss()
    }
}
