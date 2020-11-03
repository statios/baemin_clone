//
//  BasePageViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/11/02.
//

import UIKit
import RxSwift
import RxCocoa

class BasePageViewController: UIPageViewController {
  
  struct Metric {
    static let pageBarHeight: CGFloat = 44
  }
  
  var disposeBag = DisposeBag()
  
  var currentPage = BehaviorRelay<Int>(value: 0)
  
  var pageViewControllers = [UIViewController]()
  var pageBar: PageBar!
  
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
        make.height.equalTo(Metric.pageBarHeight)
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
    pageBar.setPageBarItems(viewControllers)
    let scrollView = view.subviews.filter { $0 is UIScrollView }.first as! UIScrollView
    scrollView.delegate = self
  }
  func setSelectedText(_ color: UIColor?) {
    pageBar.pageBarItems.enumerated().forEach { (offset, pageBarItem) in
      pageBarItem.selectedFontColor = color
      pageBarItem.isSelected.accept(offset == currentPage.value)
    }
  }
  
  func setUnselectedText(_ color: UIColor?) {
    pageBar.pageBarItems.enumerated().forEach { (offset, pageBarItem) in
      pageBarItem.unselectedFontColor = color
      pageBarItem.isSelected.accept(offset == currentPage.value)
    }
  }
  
  func setSelected(_ font: UIFont?) {
    pageBar.pageBarItems.enumerated().forEach { (offset, pageBarItem) in
      pageBarItem.selectedFont = font
      pageBarItem.isSelected.accept(offset == currentPage.value)
    }
  }
  
  func setUnselected(_ font: UIFont?) {
    pageBar.pageBarItems.enumerated().forEach { (offset, pageBarItem) in
      pageBarItem.unselectedFont = font
      pageBarItem.isSelected.accept(offset == currentPage.value)
    }
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
    guard pageViewControllers.count-1 >= nextIndex else {
      return nil
    }
    return pageViewControllers[nextIndex]
  }
  
  func pageViewController(
    _ pageViewController: UIPageViewController,
    didFinishAnimating finished: Bool,
    previousViewControllers: [UIViewController],
    transitionCompleted completed: Bool) {
    guard completed else { return }
    if let currentViewController = pageViewController.viewControllers?.first,
       let index = pageViewControllers.firstIndex(of: currentViewController) {
      currentPage.accept(index)
      pageBar.currentPage.accept(index)
    }
  }
}

extension BasePageViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {

  }
}
