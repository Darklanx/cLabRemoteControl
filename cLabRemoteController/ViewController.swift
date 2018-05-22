//
//  ViewController.swift
//  cLabRemoteController
//
//  Created by Tim Lu on 2018/5/18.
//  Copyright © 2018 Demilab. All rights reserved.
//

import Cocoa
import ImageIO

class ViewController: NSViewController {
    @IBOutlet weak var imageCell: NSImageView!
    @IBOutlet weak var ipField: NSTextField!
    @IBAction func ipFieldFilled(_ sender: Any) {
        print("ip button HIT! text:", ipField.stringValue)
        self.socket.setConn(host: ipField.stringValue)
    }
    @IBAction func inputMethodControlAction(_ sender: Any) {
        if (inputMethodControl.isSelected(forSegment: 0)) {  // Keyboard
            
        } else if (inputMethodControl.isSelected(forSegment: 0)) {  // Game Controller
            
        } else {
            print("input selection button reports weird activity")
        }
    }
    @IBOutlet weak var inputMethodControl: NSSegmentedControl!
    @IBOutlet weak var directionIndicator: NSSlider!
    @IBOutlet weak var powerLevelIndicator: NSLevelIndicator!
    
    
    // Cmd is made of tuple (RightWheelDutyCycle, LeftWheelDutyCycle)
    
    /* Backup Controls */
    @IBAction func FdButtonPressed(_ sender: Any) {
        socket.sendCommand(cmd: "80, 80")
    }
    @IBAction func BkButtonPressed(_ sender: Any) {
        socket.sendCommand(cmd: "-80, -80")
    }
    @IBAction func RtButtonPressed(_ sender: Any) {
        socket.sendCommand(cmd: "-70, 70")
    }
    @IBAction func LtButtonPressed(_ sender: Any) {
        socket.sendCommand(cmd: "70, -70")
    }
    
    
    var socket = SocketClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        socket.imageDelegate = self
        //socket.setConn(host: "127.0.0.1")
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        //socket.imageDelegate = self
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}

extension ViewController: ImageDelegate {
    func receivedMessage(message: String) {
        print("view got msg")
        //print("view got msg:", message)
    }
}

