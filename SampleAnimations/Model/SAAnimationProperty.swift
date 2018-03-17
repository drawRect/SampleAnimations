//
//  AnimationProperty.swift
//  SampleAnimations
//
//  Created by Boominadha Prakash on 17/03/18.
//  Copyright © 2018 Boominadha Prakash. All rights reserved.
//

import Foundation
import UIKit

struct SAAnimationProperty {
    var animationName: SAAnimationName
    var duration: CFTimeInterval
    var type: SAType
    var subtype: SASubType?
    var timingFunctionName: String
    
    init(animationName: SAAnimationName, duration: CFTimeInterval = 1.0,
         type: SAType,
         subtype: SASubType?,
         timingFunctionName: String = kCAMediaTimingFunctionEaseInEaseOut) {
        self.animationName = animationName
        self.duration = duration
        self.type = type
        self.subtype = subtype
        self.timingFunctionName = timingFunctionName
    }
}
enum SAAnimationName: String {
    case fromRight; case fromLeft; case fromTop; case fromBottom; case fade
    var desc: String {
        switch self {
        case .fromRight: return "Left to Right"
        case .fromLeft: return "Right to Left"
        case .fromTop: return "Bottom to Top"
        case .fromBottom: return "Top to Bottom"
        case .fade: return "Fade"
        }
    }
}
enum SAType: String {
    
    /* kCATransitionPush - The layer pushes any existing content as it slides into place
     * kCATransitionFade - Default Transition. The layer fades as it becomes visible or hidden.
     * Subtypes are not available for Fade Transition.
     * kCATransitionMoveIn - The layer slides into place over any existing content
     * kCATransitionReveal - The layer gradually revealed in the direction specified by the
     * transition subtype. */
    
    case push; case fade; case movein; case reveal
    var desc: String {
        switch self {
        case .push: return kCATransitionPush
        case .fade: return kCATransitionFade
        case .movein: return kCATransitionMoveIn
        case .reveal: return kCATransitionReveal
        }
    }
}
enum SASubType: String {
    
    /* kCATransitionFromLeft - Transition begins at the left side of the layer
     * kCATransitionFromRight - Transition begins at the right side of the layer
     * kCATransitionFromTop - Transition begins at the top side of the layer
     * kCATransitionFromBottom - Transition begins at the bottom side of the layer */
    
    case left; case right; case top; case bottom; case notExist
    var desc: String {
        switch self {
        case .left: return kCATransitionFromLeft
        case .right: return kCATransitionFromRight
        case .top: return kCATransitionFromTop
        case .bottom: return kCATransitionFromBottom
        case .notExist: return "Subtypes are not available"
        }
    }
}
