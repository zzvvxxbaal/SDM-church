import Foundation

#if DEBUG

enum PreviewData {
    
    static let sampleUser = User(
        name: "정현석",
        email: "hyunseok@example.com",
        profileImage: "person.crop.circle.fill"
    )
    
    static let samplePrayer = Prayer(
        id: UUID(),
        title: "Health",
        content: "Pray for health",
        createdBy: UUID(),
        createdAt: Date(),
        attendeeCount: 5
    )
    
    static let sampleEvent = ChurchEvent(
        id: UUID(),
        title: "Weekly Worship",
        description: "Sunday worship service",
        date: Date(),
        location: "Main Hall",
        category: "Worship"
    )
    
    static let sampleNotice = Devotional(
        id: UUID(),
        title: "Daily Devotional",
        content: "Today's reflection",
        date: Date(),
        author: "Pastor",
        imageURL: nil
    )
    
}

#endif
