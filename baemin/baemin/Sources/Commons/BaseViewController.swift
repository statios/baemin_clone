//
//  BaseViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import RxSwift
import UIKit

class BaseViewController: UIViewController {
  
  var disposeBag = DisposeBag()
  
  lazy private(set) var className: String = {
    return type(of: self).description().components(separatedBy: ".").last ?? ""
  }()
  
  var viewController: UIViewController {
    return self
  }
  
  init() {
    super.init(nibName: nil, bundle: nil)
    initialize()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit {
    Log.verbose("DEINIT: \(self.className)")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupBinding()
  }
  
  @objc dynamic func initialize() {
    //Don't call view in here
  }
  
  @objc dynamic func setupUI() {

  }
  
  @objc dynamic func setupBinding() {

  }

}

