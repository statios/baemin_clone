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
  var pageBar: PageBar!
  var currentIndex: Int = 0
  
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
    pageBar = PageBar().asChainable()
    .add(to: view)
    .makeConstraints { (make) in
      make.leading.trailing.equalToSuperview()
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      make.height.equalTo(44)
    }.origin
  }
  
  @objc dynamic func setupBinding() {

  }
  
  func setPageViewControllers(_ viewControllers: [UIViewController]) {
    pageViewControllers = viewControllers
    setViewControllers([viewControllers.first].compactMap { $0 },
                       direction: .forward,
                       animated: true,
                       completion: nil)
    let scrollView = view.subviews.filter { $0 is UIScrollView }.first as! UIScrollView
    scrollView.delegate = self
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
    currentIndex = index
    let previousIndex = index - 1
    guard previousIndex >= 0 else {
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
    currentIndex = index
    let nextIndex = index + 1
    guard pageViewControllers.count-1 >= nextIndex else {
      return nil
    }
    return pageViewControllers[nextIndex]
  }
}

extension BasePageViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {

  }
}
