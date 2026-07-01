import SwiftUI

struct GlassVariant {
    let name: String
    let materialType: GlassMaterialType
    let configuration: GlassConfiguration
    let cornerRadius: CGFloat
    let shadowConfiguration: GlassShadowConfig
}

struct GlassShadowConfig {
    let radius: CGFloat
    let opacity: CGFloat
    let offset: CGSize
}

struct GlassVariants {
    static let floating = GlassVariant(
        name: "Floating Glass",
        materialType: .floating,
        configuration: .quality,
        cornerRadius: 28,
        shadowConfiguration: GlassShadowConfig(
            radius: 24,
            opacity: 0.15,
            offset: CGSize(width: 0, height: 12)
        )
    )
    
    static let toolbar = GlassVariant(
        name: "Toolbar Glass",
        materialType: .toolbar,
        configuration: .standard,
        cornerRadius: 16,
        shadowConfiguration: GlassShadowConfig(
            radius: 16,
            opacity: 0.08,
            offset: CGSize(width: 0, height: 4)
        )
    )
    
    static let navigation = GlassVariant(
        name: "Navigation Glass",
        materialType: .navigation,
        configuration: .standard,
        cornerRadius: 12,
        shadowConfiguration: GlassShadowConfig(
            radius: 20,
            opacity: 0.12,
            offset: CGSize(width: 0, height: 8)
        )
    )
    
    static let card = GlassVariant(
        name: "Card Glass",
        materialType: .card,
        configuration: .quality,
        cornerRadius: 20,
        shadowConfiguration: GlassShadowConfig(
            radius: 20,
            opacity: 0.13,
            offset: CGSize(width: 0, height: 10)
        )
    )
    
    static let button = GlassVariant(
        name: "Button Glass",
        materialType: .button,
        configuration: .standard,
        cornerRadius: 12,
        shadowConfiguration: GlassShadowConfig(
            radius: 12,
            opacity: 0.07,
            offset: CGSize(width: 0, height: 4)
        )
    )
    
    static let capsule = GlassVariant(
        name: "Capsule Glass",
        materialType: .capsule,
        configuration: .standard,
        cornerRadius: 24,
        shadowConfiguration: GlassShadowConfig(
            radius: 8,
            opacity: 0.06,
            offset: CGSize(width: 0, height: 2)
        )
    )
    
    static let sidebar = GlassVariant(
        name: "Sidebar Glass",
        materialType: .thick,
        configuration: .quality,
        cornerRadius: 0,
        shadowConfiguration: GlassShadowConfig(
            radius: 16,
            opacity: 0.1,
            offset: CGSize(width: 2, height: 0)
        )
    )
    
    static let search = GlassVariant(
        name: "Search Glass",
        materialType: .thin,
        configuration: .standard,
        cornerRadius: 10,
        shadowConfiguration: GlassShadowConfig(
            radius: 8,
            opacity: 0.05,
            offset: CGSize(width: 0, height: 2)
        )
    )
    
    static let sheet = GlassVariant(
        name: "Sheet Glass",
        materialType: .thick,
        configuration: .quality,
        cornerRadius: 20,
        shadowConfiguration: GlassShadowConfig(
            radius: 30,
            opacity: 0.2,
            offset: CGSize(width: 0, height: 16)
        )
    )
    
    static let dialog = GlassVariant(
        name: "Dialog Glass",
        materialType: .thick,
        configuration: .ultraQuality,
        cornerRadius: 24,
        shadowConfiguration: GlassShadowConfig(
            radius: 32,
            opacity: 0.25,
            offset: CGSize(width: 0, height: 20)
        )
    )
    
    static let ultraThin = GlassVariant(
        name: "Ultra Thin Glass",
        materialType: .ultraThin,
        configuration: .standard,
        cornerRadius: 16,
        shadowConfiguration: GlassShadowConfig(
            radius: 8,
            opacity: 0.04,
            offset: CGSize(width: 0, height: 2)
        )
    )
    
    static let `default` = GlassVariant(
        name: "Default Glass",
        materialType: .regular,
        configuration: .standard,
        cornerRadius: 16,
        shadowConfiguration: GlassShadowConfig(
            radius: 16,
            opacity: 0.1,
            offset: CGSize(width: 0, height: 8)
        )
    )
    
    static func all() -> [GlassVariant] {
        [
            floating,
            toolbar,
            navigation,
            card,
            button,
            capsule,
            sidebar,
            search,
            sheet,
            dialog,
            ultraThin,
            `default`
        ]
    }
}

extension View {
    func liquidGlassVariant(_ variant: GlassVariant) -> some View {
        modifier(
            GlassRenderer(
                materialType: variant.materialType,
                cornerRadius: variant.cornerRadius,
                configuration: variant.configuration
            )
        )
        .shadow(
            color: AppShadow.color,
            radius: variant.shadowConfiguration.radius,
            x: variant.shadowConfiguration.offset.width,
            y: variant.shadowConfiguration.offset.height
        )
    }
}
