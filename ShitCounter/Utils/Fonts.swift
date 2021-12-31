//
//  Fonts.swift
//  ShitCounter
//
//  Created by Dipesh Dhakal on 28/12/2021.
//

import SwiftUI

extension Font {
    
    static var navigationTitleFont: Font {
        return .title.bold()
    }
    
    static var buttonTitleFont: Font {
        return .title2.bold()
    }
    
    static var titleFont: Font {
        return .title
    }
    
    static var titleBoldFont: Font {
        return .largeTitle.bold()
    }
    
    static var cellTitleFont: Font {
        return .headline
    }
    
    static var cellDetailFont: Font {
        return .subheadline
    }
    
    static var navButtonFont: Font {
        return .subheadline
    }
    
    static var formSectionFont: Font {
        return .subheadline
    }
    
    static var superLargeBoldFont: Font {
        return Font.system(size: 50).bold()
    }
}
