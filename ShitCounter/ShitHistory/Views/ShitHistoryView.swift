//
//  ShitHistoryView.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 19/12/21.
//

import Foundation
import SwiftUI

struct ShitHistoryView: View {

    var body: some View {

        BaseView(content:
            VStack {
                CalendarWrapperView(calendar: Calendar.current)
                Spacer()
            })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExampleCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ShitHistoryView()
    }
}
