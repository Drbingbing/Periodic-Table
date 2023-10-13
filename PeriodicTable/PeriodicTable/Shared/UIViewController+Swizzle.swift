//
//  UIViewController+Swizzle.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/13.
//

import UIKit

private func swizzle(_ vc: UIViewController.Type) {
    [
        (#selector(vc.viewDidLoad), #selector(vc.pt_viewDidLoad)),
        (#selector(vc.viewWillAppear), #selector(vc.pt_viewWillAppear)),
        (#selector(vc.viewWillTransition), #selector(vc.pt_viewWillTransition))
    ].forEach { original, swizzled in
        
        guard let originalMethod = class_getInstanceMethod(vc, original),
              let swizzledMethod = class_getInstanceMethod(vc, swizzled) else { return }
        
        let didAddViewDidLoadMethod = class_addMethod(
            vc,
            original,
            method_getImplementation(swizzledMethod),
            method_getTypeEncoding(swizzledMethod)
        )
        
        if didAddViewDidLoadMethod {
            class_replaceMethod(
                vc,
                swizzled,
                method_getImplementation(originalMethod),
                method_getTypeEncoding(originalMethod)
            )
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }

}

private var hasSwizzled = false

extension UIViewController {
    
    public final class func doBadSwizzleStuff() {
        guard !hasSwizzled else { return }
        
        hasSwizzled = true
        swizzle(self)
    }
    
    @objc fileprivate func pt_viewDidLoad() {
        pt_viewDidLoad()
        bindingViewModel()
        bindingUI()
    }

    @objc fileprivate func pt_viewWillAppear(_ animated: Bool) {
        pt_viewWillAppear(animated)
        if !hasViewAppeared {
            bindingStyle()
            hasViewAppeared = true
        }
    }
    
    @objc public func pt_viewWillTransition(
        to size: CGSize,
        with coordinator: UIViewControllerTransitionCoordinator
    ) {
        pt_viewWillTransition(to: size, with: coordinator)
        bindingStyle()
    }
    
    @objc open func bindingUI() {}
    
    @objc open func bindingViewModel() {}
    
    @objc open func bindingStyle() {}
    
    
    private struct AssociatedKeys {
        static var hasViewAppeared = "hasViewAppeared"
    }
    
    private var hasViewAppeared: Bool {
        get {
            withUnsafePointer(to: &AssociatedKeys.hasViewAppeared) {
                return objc_getAssociatedObject(self, $0) as? Bool ?? false
            }
        }
        set {
            withUnsafePointer(to: &AssociatedKeys.hasViewAppeared) {
                objc_setAssociatedObject(self, $0, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}
