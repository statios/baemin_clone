//
//  BaseNavigationController.swift
//  baemin
//
//  Created by Stat.So on 2020/11/01.
//

import RxSwift
import UIKit

class BaseNavigationController: UINavigationController {
  var disposeBag = DisposeBag()
  
  lazy private(set) var className: String = {
    return type(of: self).description().components(separatedBy: ".").last ?? ""
  }()
  
  var viewController: UIViewController {
    return self
  }
  
  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
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
    navigationBar.barTintColor = Color.white
    navigationBar.isTranslucent = false
    navigationBar.shadowImage = UIImage()
  }
  
  @objc dynamic func setupBinding() {

  }
}


