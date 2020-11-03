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
    rx.viewWillAppear.take(1)
      .subscribe(onNext: { [weak self] _ in 
        self?.setupUI()
        self?.setupBinding()
      }).disposed(by: disposeBag)
  }
  
  @objc dynamic func setupUI() {
    view.asChainable()
      .background(color: Color.white)
    tabBar.asChainable()
      .tint(color: Color.cyan)
      .unselectedItemTint(color: Color.doveGray)
      .barTint(color: Color.wildSand)
  }
  
  @objc dynamic func setupBinding() {

  }
}


