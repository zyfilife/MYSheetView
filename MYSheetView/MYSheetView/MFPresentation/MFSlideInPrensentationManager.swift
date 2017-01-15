//
//  MFSlideInPrensentationManager.swift
//  SmartCloud
//
//  Created by 朱益锋 on 2017/1/12.
//  Copyright © 2017年 SmartPower. All rights reserved.
//

import UIKit

enum PrensentaionDirection {
    case left, top, right, bottom, center
}

class MFSlideInPrensentationManager: NSObject {
    
    var direction = PrensentaionDirection.left
    var disableCompactHeight = true
    
    var customWidth: CGFloat?
    var customHeight: CGFloat?
}

extension MFSlideInPrensentationManager: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = MFSlideInPresentationController(presentedViewController: presented, presenting: presenting, direction: self.direction)
        presentationController.customWidth = self.customWidth
        presentationController.customHeight = self.customHeight
        presentationController.delegate = self
        return presentationController
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MFSliderPresentationAnimator(direction: direction, isPresentation: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MFSliderPresentationAnimator(direction: direction, isPresentation: false)
    }
}

extension MFSlideInPrensentationManager: UIAdaptivePresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        if traitCollection.verticalSizeClass == .compact && self.disableCompactHeight {
            return .overFullScreen
        }else {
            return .none
        }
    }
}
