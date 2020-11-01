//
//  BaseTabBarViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import UIKit

class BaseTabBarController: UITabBarController {
  
  var disposeBag = DisposeBag()
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit { }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @objc dynamic func setupUI() {
    view.asChainable()
      .background(color: Color.white)
  }
  
  @objc dynamic func setupBinding() {

  }

}


