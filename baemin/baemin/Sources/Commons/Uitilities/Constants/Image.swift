//
//  Image.swift
//  baemin
//
//  Created by Stat.So on 2020/11/01.
//

import UIKit

extension UIImage {
  func rotate(orientation: Orientation) -> UIImage? {
    guard let landscapeCGImage = self.cgImage else { return nil }
    return UIImage(cgImage: landscapeCGImage, scale: self.scale, orientation: orientation)
  }
  func resized(to size: CGSize) -> UIImage {
    return UIGraphicsImageRenderer(size: size).image { _ in
      draw(in: CGRect(origin: .zero, size: size))
    }
  }
}

struct Image {
  struct Icon {
    static let home = UIImage(named: "home")
    static let video = UIImage(named: "video")
    static let list = UIImage(named: "list")
    static let like = UIImage(named: "like")
    static let user = UIImage(named: "user")
    //12*12
    static let arrowRight12 = Image.Icon.arrowRight20?.resized(to: CGSize(width: 12, height: 12))
    //20*20
    static let arrowDown20 = UIImage(named: "arrow_down20")
    static let arrowRight20 = Image.Icon.arrowDown20?.rotate(orientation: .left)
    //24*24
    static let arrowDown24 = UIImage(named: "arrow_down24")
    static let alarm24 = UIImage(named: "alarm24")
    static let qrcode24 = UIImage(named: "qrcode24")
    static let back24 = UIImage(named: "back24")
    static let close24 = UIImage(named: "close24")
    static let refresh24 = UIImage(named: "refresh24")
    static let flashOn24 = UIImage(named: "flashOn24")
    static let flashOff24 = UIImage(named: "flashOff24")
    static let search24 = UIImage(named: "search24")
  }
  struct Illust {
    //Logo
    static let splashLogo = UIImage(named: "splash_logo")
    static let splashLogoBottom = UIImage(named: "splash_logo_bottom")
    //Category
    static let bakery42 = UIImage(named: "bakery42")
    static let chicken42 = UIImage(named: "chicken42")
    static let coffee42 = UIImage(named: "coffee42")
    static let fastfood42 = UIImage(named: "fastfood42")
    static let pizza42 = UIImage(named: "pizza42")
    static let rice42 = UIImage(named: "rice42")
    static let seafood42 = UIImage(named: "seafood42")
    static let sushi42 = UIImage(named: "sushi42")
  }
}
