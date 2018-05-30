//
//  ViewController.swift
//  myARapp
//
//  Created by Stephan Kilim on 3/24/18.
//  Copyright © 2018 Stephan Kilim. All rights reserved.
// ONLY RUNS ON iOS DEVICES WITH AN A9 PROCESSOR.
import UIKit
import ARKit
import  SceneKit
class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
 
    }
    func randomFloat(min: Float, max: Float) -> Float {
        return (Float(arc4random())/0xFFFFFFFF)*(max-min) + min
    }
    @IBAction func addCube(_ sender: Any) {
        let cZ = randomFloat(min: -2, max: -0.2)
        let cubeNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
    
        let cc = getCameraCoordinates(sceneView: sceneView)
        cubeNode.position = SCNVector3(cc.x, cc.y, cc.z)
        sceneView.scene.rootNode.addChildNode(cubeNode)
    }
    struct myCameraCoordinates {
        var x = Float()
        var y = Float()
        var z = Float()
    }
    func getCameraCoordinates(sceneView: ARSCNView) -> myCameraCoordinates {
        let cameraTransform = sceneView.session.currentFrame?.camera.transform
        let cameraCoordinates = MDLTransform(matrix: (cameraTransform)!)
        let cc = myCameraCoordinates()
        cc.x - cameraCoordinates.translation.x
        cc.y - cameraCoordinates.translation.y
        cc.z - cameraCoordinates.translation.z
        return cc
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

