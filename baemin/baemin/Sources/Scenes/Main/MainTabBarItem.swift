//
//  MainTabBarItem.swift
//  baemin
//
//  Created by Stat.So on 2020/11/02.
//

import UIKit

enum MainTabBarItem: CaseIterable {
  case home
  case suggest
  case like
  case list
  case user
}
extension MainTabBarItem {
  var title: String {
    switch self {
    case .home: return Text.home
    case .suggest: return Text.whatToEat
    case .like: return Text.favoriteStore
    case .list: return Text.orderHistory
    case .user: return Text.myBaemin
    }
  }
  var image: UIImage? {
    switch self {
    case .home: return Image.Icon.home
    case .suggest: return Image.Icon.video
    case .like: return Image.Icon.like
    case .list: return Image.Icon.list
    case .user: return Image.Icon.user
    }
  }
  var viewController: UIViewController {
    switch self {
    case .home: return HomeViewController()
    case .suggest: return SuggestViewController()
    case .like: return LikeViewController()
    case .list: return ListViewController()
    case .user: return UserViewController()
    }
  }
}
