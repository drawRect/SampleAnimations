//
//  AnimationType.swift
//  SampleAnimations
//
//  Created by Boominadha Prakash on 17/03/18.
//  Copyright © 2018 Boominadha Prakash. All rights reserved.
//

import Foundation

struct SAAnimationType {
    var name: SASectionName
    var properties: [SAAnimationProperty] = [SAAnimationProperty]()
    init(name: SASectionName, properties: [SAAnimationProperty]) {
        self.name = name
        properties.forEach { p in
            self.properties.append(SAAnimationProperty.init(animationName: p.animationName,duration: p.duration, type: p.type, subtype: p.subtype, timingFunctionName: p.timingFunctionName))
        }
    }
}

enum SASectionName: String {
    case push; case fade; case movein; case reveal
    var desc: String {
        switch self {
        case .push: return "Push"
        case .fade: return "Fade"
        case .movein: return "Move-In"
        case .reveal: return "Reveal"
        }
    }
}
