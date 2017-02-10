//
//  SliderPresentationAnimator.swift
//  SmartCloud
//
//  Created by 朱益锋 on 2017/1/14.
//  Copyright © 2017年 朱益锋. All rights reserved.
//

import UIKit

class SliderPresentationAnimator: NSObject {
    
    let direction: PrensentaionDirection
    let isPresentation: Bool
    
    init(direction: PrensentaionDirection, isPresentation: Bool) {
        self.direction = direction
        self.isPresentation = isPresentation
        super.init()
    }
}

extension SliderPresentationAnimator: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let key = isPresentation ? UITransitionContextViewControllerKey.to : UITransitionContextViewControllerKey.from
        let controller = transitionContext.viewController(forKey: key)!
        
        if isPresentation {
            transitionContext.containerView.addSubview(controller.view)
        }
        
        let presentedFrame = transitionContext.finalFrame(for: controller)
        var dismissedFrame = presentedFrame
        switch direction {
        case .left:
            dismissedFrame.origin.x = -presentedFrame.width
        case .right:
            dismissedFrame.origin.x = transitionContext.containerView.frame.size.width
        case .top:
            dismissedFrame.origin.y = -presentedFrame.height
        case .bottom:
            dismissedFrame.origin.y = transitionContext.containerView.frame.size.height
        case .center:
            break
        }
        
        let initialFrame = isPresentation ? dismissedFrame : presentedFrame
        let finalFrame = isPresentation ? presentedFrame : dismissedFrame
        
        let animationDuration = transitionDuration(using: transitionContext)
        
        if direction == .center {
            controller.view.frame = finalFrame
            if isPresentation {
                controller.view.alpha = 0.0
                controller.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseIn, .allowUserInteraction, .beginFromCurrentState], animations: {
                    controller.view.alpha = 1.0
                    controller.view.transform = CGAffineTransform.identity
                }) { (finished) in
                    transitionContext.completeTransition(finished)
                }
            }else {
                UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseOut, .allowUserInteraction, .beginFromCurrentState], animations: {
                    controller.view.alpha = 0.0
                    controller.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                }) { (finished) in
                    transitionContext.completeTransition(finished)
                }
            }
            
            return
        }
        
        controller.view.frame = initialFrame
        UIView.animate(withDuration: animationDuration, animations: {
            controller.view.frame = finalFrame
        }) { finished in
            transitionContext.completeTransition(finished)
        }
    }
}
