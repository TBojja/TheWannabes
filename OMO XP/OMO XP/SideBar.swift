//
//  SideBar.swift
//  OMO XP
//
//  Created by Casper Castellini on 4/24/17.
//  Copyright © 2017 Appomo. All rights reserved.
//

import UIKit

@objc protocol SideBarDelegate {
    func sideBarDidSelectButtonAtIndex(index:Int)
    @objc optional func sideBarWillClose()
    @objc optional func sideBarWillOpen()
}

class SideBar: NSObject, SideBarTableVCDelegate {
    
    let barWidth: CGFloat = 150.0
    let sideBarTableViewTopInset: CGFloat = 64.0
    let sideBarContainerView: UIView = UIView()
    let sideBarTableVC: SideBarTableVC = SideBarTableVC()
    var originView: UIView! = nil
    var animator: UIDynamicAnimator!
    var delegate: SideBarDelegate?
    var isSideBarOpen: Bool = false
    
    override init() {
        super.init()
    }
    
    init(sourceView: UIView, menuItems: Array<String>) {
        super.init()
        originView = sourceView
        sideBarTableVC.tableData = menuItems
        
        setupSideBar()
        
        animator = UIDynamicAnimator(referenceView: originView)
        
        let showGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector(("handleSwipe:")))
        showGestureRecognizer.direction = UISwipeGestureRecognizerDirection.right
        originView.addGestureRecognizer(showGestureRecognizer)
        
        let hideGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector(("handleSwipe:")))
        hideGestureRecognizer.direction = UISwipeGestureRecognizerDirection.left
        originView.addGestureRecognizer(hideGestureRecognizer)
        
    }
    
    func setupSideBar() {
        sideBarContainerView.frame = CGRect(x: -barWidth - 1, y: originView.frame.origin.y, width: barWidth, height: originView.frame.size.height)
        sideBarContainerView.backgroundColor = UIColor.white
        sideBarContainerView.clipsToBounds = false
        
        originView.addSubview(sideBarContainerView)
        
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.light))
        
        blurView.frame = sideBarContainerView.bounds
        sideBarContainerView.addSubview(blurView)
        
        sideBarTableVC.delegate = self
        sideBarTableVC.tableView.frame = sideBarContainerView.bounds
        sideBarTableVC.tableView.clipsToBounds = false
        sideBarTableVC.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        sideBarTableVC.tableView.backgroundColor = UIColor.clear
        sideBarTableVC.tableView.contentInset = UIEdgeInsetsMake(sideBarTableViewTopInset, 0, 0, 0)
        
        sideBarTableVC.tableView.reloadData()
        
        sideBarContainerView.addSubview(sideBarTableVC.tableView)
    }
    
    
    func handleSwipe(recognizer: UISwipeGestureRecognizer) {
        if recognizer.direction == UISwipeGestureRecognizerDirection.left {
           showSideBar(shouldOpen: false)
            delegate?.sideBarWillClose?()
        } else {
            showSideBar(shouldOpen: true)
            delegate?.sideBarWillOpen?()
        }
    }
    
    
    func showSideBar(shouldOpen: Bool) {
        animator.removeAllBehaviors()
        isSideBarOpen = shouldOpen
        
        let gravityX: CGFloat = (shouldOpen) ? 0.5 : -0.5
        let magnitude: CGFloat = (shouldOpen) ? 20 : -20
        let boundaryX: CGFloat = (shouldOpen) ? barWidth : -barWidth - 1
        
        let gravityBehavior: UIGravityBehavior = UIGravityBehavior(items: [sideBarContainerView])
        gravityBehavior.gravityDirection = CGVector(dx: gravityX, dy: 0)
        animator.addBehavior(gravityBehavior)
        
        let collisionBehavior: UICollisionBehavior = UICollisionBehavior(items: [sideBarContainerView])
        collisionBehavior.addBoundary(withIdentifier: "sideBarBoundary" as NSCopying, from:CGPoint(x: boundaryX, y: 20), to:(CGPoint(x: boundaryX, y: originView.frame.size.height)))
        animator.addBehavior(collisionBehavior)
        
        let pushBehavior: UIPushBehavior = UIPushBehavior(items: [sideBarContainerView], mode: UIPushBehaviorMode.instantaneous)
        pushBehavior.magnitude = magnitude
        animator.addBehavior(pushBehavior)
        
        let sideBarBehavior: UIDynamicItemBehavior = UIDynamicItemBehavior(items: [sideBarContainerView])
        sideBarBehavior.elasticity = 0.3
        animator.addBehavior(sideBarBehavior)
        
    }
    
    func sideBarControlDidSelectRow(indexPath: NSIndexPath) {
        delegate?.sideBarDidSelectButtonAtIndex(index: indexPath.row)
    }
    
}
