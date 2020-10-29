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
  
  var viewController: UIViewController {
    return self
  }
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit { }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupBinding()
  }
  
  @objc dynamic func setupUI() {

  }
  
  @objc dynamic func setupBinding() {

  }

}

