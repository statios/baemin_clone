//
//  QrcodeViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import UIKit
import RxSwift
import Resolver
import AVFoundation

class QrcodeViewController: BaseViewController, AVCaptureMetadataOutputObjectsDelegate {
  @Injected var viewModel: QrcodeViewModel
  @Injected var navigator: HomeNavigator
  
  private let closeButton = UIButton()
  private let flashButton = UIButton()
  private let guideImage = UIImageView()
  private let cameraView = UIView()
  
  var captureSession: AVCaptureSession!
  var previewLayer: AVCaptureVideoPreviewLayer!
  
}

extension QrcodeViewController {
  override func setupUI() {
    super.setupUI()
    
    self.asChainable()
      .title(Text.qrcodeOrder)
    
    view.asChainable()
      .background(color: Color.white)
    
    closeButton.asChainable()
      .setImage(Image.Icon.close24, for: .normal)
      .addBarButtonItem(self, position: .left)
    
    flashButton.asChainable()
      .addBarButtonItem(self, position: .right)
    
    guideImage.asChainable()
      .image(Image.Illust.qrcodeGuide)
      .contentMode(.scaleAspectFit)
      .add(to: view)
      .makeConstraints { (make) in
        make.centerX.equalToSuperview()
        make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        make.width.equalTo(Device.width)
        make.height.equalTo(Device.width/2)
      }
    
    cameraView.asChainable()
      .background(color: Color.black)
      .add(to: view)
      .makeConstraints { (make) in
        make.leading.trailing.equalToSuperview()
        make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        make.height.equalTo(Device.width)
      }
    
    
//    view.backgroundColor = UIColor.black
    captureSession = AVCaptureSession()
    
    guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
    let videoInput: AVCaptureDeviceInput
    
    do {
      videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
    } catch {
      return
    }
    
    if (captureSession.canAddInput(videoInput)) {
      captureSession.addInput(videoInput)
    } else {
      failed()
      return
    }
    
    let metadataOutput = AVCaptureMetadataOutput()
    
    if (captureSession.canAddOutput(metadataOutput)) {
      captureSession.addOutput(metadataOutput)
      
      metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
      metadataOutput.metadataObjectTypes = [.qr]
    } else {
      failed()
      return
    }
    
    cameraView.superview?.layoutIfNeeded()
    previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
    previewLayer.frame = cameraView.layer.bounds
    previewLayer.videoGravity = .resizeAspectFill
    cameraView.layer.addSublayer(previewLayer)
    
    captureSession.startRunning()
    
  }
  
  func failed() {
    let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: "OK", style: .default))
    present(ac, animated: true)
    captureSession = nil
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if (captureSession?.isRunning == false) {
      captureSession.startRunning()
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    if (captureSession?.isRunning == true) {
      captureSession.stopRunning()
    }
  }
  
  func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
//    captureSession.stopRunning()
    
    if let metadataObject = metadataObjects.first {
      guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
      guard let stringValue = readableObject.stringValue else { return }
      AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
      found(code: stringValue)
      Log.info(stringValue)
    }
    
//    dismiss(animated: true)
  }
  
  func found(code: String) {
    print(code)
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .portrait
  }
}

extension QrcodeViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = QrcodeViewModel.Event(
      tapFlash: flashButton.rx.tap.void(),
      tapClose: closeButton.rx.tap.void()
    )
    let state = viewModel.reduce(event: event)
    
    state.flash
      .drive(onNext: { [weak self] in
        self?.flashButton.setImage(
          $0 ? Image.Icon.flashOn24
            : Image.Icon.flashOff24,
          for: .normal)
      }).disposed(by: disposeBag)
    
    state.popToHome
      .drive(onNext: { [weak self] in
        self?.navigationController?.popViewController(animated: true)
      }).disposed(by: disposeBag)
  }
}

