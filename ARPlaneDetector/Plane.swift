//
//  Plane.swift
//  ARPlaneDetector
//
//  Created by Ben Lambert on 2/8/18.
//  Copyright © 2018 collectiveidea. All rights reserved.
//

import Foundation
import ARKit

class Plane: SCNNode {
    
    let plane: SCNPlane
    
    init(anchor: ARPlaneAnchor) {
        plane = SCNPlane(width: CGFloat(anchor.extent.x), height: CGFloat(anchor.extent.z))
        
        super.init()
        
        plane.cornerRadius = 0.005
        
        let planeNode = SCNNode(geometry: plane)
        planeNode.position = SCNVector3Make(anchor.center.x, 0, anchor.center.z)
        
        // Planes in SceneKit are vertical by default so we need to rotate 90degrees to match
        planeNode.eulerAngles.x = -.pi / 2
        
        planeNode.opacity = 0.15
        
        addChildNode(planeNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateWith(anchor: ARPlaneAnchor) {
        plane.width = CGFloat(anchor.extent.x)
        plane.height = CGFloat(anchor.extent.z)
        
        position = SCNVector3Make(anchor.center.x, 0, anchor.center.z)
    }
    
}