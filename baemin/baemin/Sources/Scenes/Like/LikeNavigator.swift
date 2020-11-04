//
//  ListNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

class LikeNavigator: BaseNavigator {
  @Injected var storeViewController: StoreViewController
  @Injected var directViewController: DirectViewController
  @Injected var phoneViewController: PhoneViewController
}

extension LikeNavigator {
  private func build() {
    Dependencies {
      Dependency { StoreViewController() }
      Dependency { StoreViewModel() }
      Dependency { DirectViewController() }
      Dependency { DirectViewModel() }
      Dependency { PhoneViewController() }
      Dependency { PhoneViewModel() }
    }.add()
  }
  func setPageViewControllers(target: LikeViewController) {
    build()
    let likePageBarItems = LikePageBarItem.allCases
    let viewControllers = [storeViewController, directViewController, phoneViewController]
    viewControllers.enumerated().forEach { (offset, viewController) in
      viewController.title = likePageBarItems[offset].title
    }
    target.setPageViewControllers(viewControllers)
  }
}
