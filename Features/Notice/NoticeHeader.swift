import SwiftUI

struct NoticeHeader: View {

    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {

            HStack(spacing: AppSpacing.compact) {

                NoticeCategoryChip(

                    title: "전체",

                    selected: true

                )

                NoticeCategoryChip(

                    title: "공지",

                    selected: false

                )

                NoticeCategoryChip(

                    title: "행사",

                    selected: false

                )

                NoticeCategoryChip(

                    title: "예배",

                    selected: false

                )

                NoticeCategoryChip(

                    title: "소그룹",

                    selected: false

                )

            }

        }

    }

}