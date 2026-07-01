import SwiftUI

struct MinistryData: Identifiable {
    let id: String
    let name: String
    let leader: String
    let icon: String
    let color: Color
    let memberCount: Int
}

struct MinistrySection: View {
    let ministries: [MinistryData]
    let onMinistryTap: ((MinistryData) -> Void)?
    
    init(
        ministries: [MinistryData]? = nil,
        onMinistryTap: ((MinistryData) -> Void)? = nil
    ) {
        self.ministries = ministries ?? [
            MinistryData(id: "1", name: "찬양팀", leader: "정현석", icon: "music.note.list", color: .blue, memberCount: 12),
            MinistryData(id: "2", name: "수호팀", leader: "김철수", icon: "eye.fill", color: .purple, memberCount: 8),
            MinistryData(id: "3", name: "중보기도", leader: "이순신", icon: "hands.sparkles.fill", color: .pink, memberCount: 15),
            MinistryData(id: "4", name: "교육팀", leader: "박민준", icon: "books.vertical.fill", color: .green, memberCount: 10),
        ]
        self.onMinistryTap = onMinistryTap
    }
    
    var body: some View {
        AppleSection(
            title: "사역팀",
            icon: "person.3.sequence.fill",
            size: .large,
            showSeeAll: true
        ) {
            HorizontalCardCarousel(
                items: ministries,
                itemSpacing: AppSpacing.medium,
                horizontalPadding: AppSpacing.large
            ) { ministry in
                Button(action: { onMinistryTap?(ministry) }) {
                    MinistryCard(ministry: ministry)
                }
            }
        }
    }
}

struct MinistryCard: View {
    let ministry: MinistryData
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            HStack(spacing: AppSpacing.small) {
                Image(systemName: ministry.icon)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(width: 40, height: 40)
                    .background(ministry.color)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(ministry.name)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(ministry.leader)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
            }
            
            HStack(spacing: AppSpacing.xSmall) {
                Image(systemName: "person.fill")
                    .font(.system(size: 11, weight: .semibold))
                Text("\(ministry.memberCount)명")
                    .font(.system(size: 12, weight: .regular))
            }
            .foregroundStyle(.secondary)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 180)
        .padding(AppSpacing.medium)
        .liquidGlass(.card, cornerRadius: AppRadius.card)
    }
}

#Preview {
    MinistrySection()
        .padding()
}
