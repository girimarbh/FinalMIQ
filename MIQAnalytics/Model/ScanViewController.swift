//
//  ScanViewController.swift
//  MIQAnalytics
//
//  Created by Girish on 18/08/20.
//  Copyright © 2020 Girish. All rights reserved.
//

import UIKit
import AVFoundation

class ScanViewController: UIViewController {
    
    let qrCodeFrameView: UIView = {
           let v=UIView()
           v.translatesAutoresizingMaskIntoConstraints=false
           return v
       }()
    
    let mainView: UIView = {
        let v=UIView()
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    let closeButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
         btn.backgroundColor = UIColor.black
        btn.setTitle("Close", for: .normal)
        btn.titleLabel?.textColor = UIColor.green
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo", size: 14)!
        //btn.titleLabel?.textAlignment = .left
        btn.contentHorizontalAlignment = .left
        btn.setTitleColor(.green, for: .normal)
       // btn.addTarget(self, action: #selector(handleClose(_:)), for: .touchUpInside)
        return btn
        
    }()

    let messagelable: UILabel = {
        let lbl=UILabel()
        //lbl.text = "54% healthy"
        lbl.font=UIFont(name: "Apple SD Gothic Neo", size: 15.0)
        lbl.textColor = UIColor.green
        lbl.backgroundColor = UIColor.clear
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()

    var captureSession = AVCaptureSession()
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    private let supportedCodeTypes = [AVMetadataObject.ObjectType.upce,
    AVMetadataObject.ObjectType.code39,
    AVMetadataObject.ObjectType.code39Mod43,
    AVMetadataObject.ObjectType.code93,
    AVMetadataObject.ObjectType.code128,
    AVMetadataObject.ObjectType.ean8,
    AVMetadataObject.ObjectType.ean13,
    AVMetadataObject.ObjectType.aztec,
    AVMetadataObject.ObjectType.pdf417,
    AVMetadataObject.ObjectType.itf14,
    AVMetadataObject.ObjectType.dataMatrix,
    AVMetadataObject.ObjectType.interleaved2of5,
    AVMetadataObject.ObjectType.qr]
    
    override func viewDidLoad() {
        
        let toolBar = UIToolbar()
        var items = [UIBarButtonItem]()
        items.append(
            UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
        )
        items.append(
            UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action:  #selector(cancel))
            )
        toolBar.setItems(items, animated: true)
        toolBar.tintColor = .red
        toolBar.barTintColor = .gray
       
        view.addSubview(toolBar)
        toolBar.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.view.frame.width, height: 60, enableInsets: false)
        
        
        var scannerview = UIView()
        self.view.addSubview(scannerview)
        scannerview.anchor(top: toolBar.bottomAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.view.frame.width, height: self.view.frame.height - 200, enableInsets: false)
        
        var label = UILabel()
        self.view.addSubview(label)
        label.anchor(top: scannerview.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.view.frame.width, height: 40, enableInsets: false)
        
        label.textAlignment = NSTextAlignment.center
        label.text = "QR Code lable"
        label.backgroundColor = UIColor.gray
        label.textColor = UIColor.red
        
        
       
                super.viewDidLoad()
       // setupviews()

                // Get the back-facing camera for capturing videos
                guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
                    print("Failed to get the camera device")
                    return
                }
                
                do {
                    // Get an instance of the AVCaptureDeviceInput class using the previous device object.
                    let input = try AVCaptureDeviceInput(device: captureDevice)
                    
                    // Set the input device on the capture session.
                    captureSession.addInput(input)
                    
                    // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
                    let captureMetadataOutput = AVCaptureMetadataOutput()
                    captureSession.addOutput(captureMetadataOutput)
                    
                    // Set delegate and use the default dispatch queue to execute the call back
                    captureMetadataOutput.setMetadataObjectsDelegate(self as! AVCaptureMetadataOutputObjectsDelegate, queue: DispatchQueue.main)
                    captureMetadataOutput.metadataObjectTypes = supportedCodeTypes
        //            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
                    
                } catch {
                    // If any error occurs, simply print it out and don't continue any more.
                    print(error)
                    return
                }
                
                // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
                videoPreviewLayer?.frame = scannerview.layer.bounds
                scannerview.layer.addSublayer(videoPreviewLayer!)
                
                // Start video capture.
                captureSession.startRunning()
                
                // Move the message label and top bar to the front
               // view.bringSubviewToFront(messageLabel)
               // view.bringSubviewToFront(topbar)
                
                // Initialize QR Code Frame to highlight the QR code
               // qrCodeFrameView = UIView()
                
               
                    qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                    qrCodeFrameView.layer.borderWidth = 2
                    scannerview.addSubview(qrCodeFrameView)
                    scannerview.bringSubviewToFront(qrCodeFrameView)
                
            }

        // Do any additional setup after loading the view.

    @objc func cancel() {
         self.dismiss(animated: true, completion: nil)
        
    }
    func setupviews()
    {
         self.view.addSubview(mainView)
        mainView.addSubview(closeButton)
        mainView.addSubview(messagelable)
        
        closeButton.anchor(top: self.view.topAnchor, left: nil, bottom: nil, right: self.view.rightAnchor, paddingTop: 3, paddingLeft: 0, paddingBottom: 3, paddingRight: 3, width: 50, height: 20, enableInsets: false)
        
        mainView.anchor(top:closeButton.bottomAnchor , left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width:500 , height: 500, enableInsets: false)
        
        messagelable.anchor(top: mainView.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 100, height: 40, enableInsets: false)
       
    }
    }
    

extension ScanViewController: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects.count == 0 {
//            qrCodeFrameView?.frame = CGRect.zero
//            messageLabel.text = "No QR code is detected"
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if supportedCodeTypes.contains(metadataObj.type) {
            // If the found metadata is equal to the QR code metadata (or barcode) then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
          //  qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
//                launchApp(decodedURL: metadataObj.stringValue!)
//                messageLabel.text = metadataObj.stringValue
            }
        }
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


