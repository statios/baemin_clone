//
//  BasePageViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/11/02.
//

import UIKit
import RxSwift

class BasePageViewController: UIPageViewController {
  
  var disposeBag = DisposeBag()
  var pageViewControllers = [UIViewController]()
  
  var pageBar: UIView!
  
  init() {
    super.init(transitionStyle: .scroll,
               navigationOrientation: .horizontal,
               options: nil)
    initialize()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupBinding()
  }
  
  @objc dynamic func initialize() {
    //Don't call view in here
    self.dataSource = self
    self.delegate = self
  }
  
  @objc dynamic func setupUI() {
    pageBar = UIView().asChainable()
      .add(to: view)
      .makeConstraints { (make) in
        make.leading.trailing.equalToSuperview()
        make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        make.height.equalTo(44)
      }
      .background(color: .systemTeal)
      .origin
  }
  
  @objc dynamic func setupBinding() {

  }
  
  func setPageViewControllers(_ viewControllers: [UIViewController]) {
    pageViewControllers = viewControllers
    setViewControllers([viewControllers.first].compactMap { $0 },
                       direction: .forward,
                       animated: true,
                       completion: nil)
  }
  
}

extension BasePageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
  func pageViewController(
    _ pageViewController: UIPageViewController,
    viewControllerBefore viewController: UIViewController)
  -> UIViewController? {
    guard let index = pageViewControllers.firstIndex(of: viewController) else {
      return nil
    }
    let previousIndex = index - 1
    guard previousIndex >= 0 else {
      return pageViewControllers.last
    }
    guard pageViewControllers.count > previousIndex else {
      return nil
    }
    return pageViewControllers[previousIndex]
  }
  
  func pageViewController(
    _ pageViewController: UIPageViewController,
    viewControllerAfter viewController: UIViewController)
  -> UIViewController? {
    guard let index = pageViewControllers.firstIndex(of: viewController) else {
      return nil
    }
    let nextIndex = index + 1
    guard nextIndex < pageViewControllers.count else {
      return pageViewControllers.first
    }
    guard pageViewControllers.count > nextIndex else {
      return nil
    }
    return pageViewControllers[nextIndex]
  }
}
