//
//  ViewController.swift
//  DynamicType
//
//  Created by Rob Lokhorst on 10/01/2019.
//  Copyright © 2019 Rob Lokhorst. All rights reserved.
//

import UIKit

// MARK: - Normal text

class ViewController1: UIViewController {

  @IBOutlet var label: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    let font = UIFont(name: "Times New Roman", size: 20)!
    let fontMetrics = UIFontMetrics(forTextStyle: .title3)
    let scaledFont = fontMetrics.scaledFont(for: font)

    label.font = scaledFont
    label.adjustsFontForContentSizeCategory = true
    label.text = "Hello"
  }
}

// MARK: - Attributed text

class ViewController2: UIViewController {

  @IBOutlet var label: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    let font = UIFont(name: "Times New Roman", size: 20)!
    let fontMetrics = UIFontMetrics(forTextStyle: .title3)
    let scaledFont = fontMetrics.scaledFont(for: font)

    let attributes: [NSAttributedString.Key: Any] = [.font: scaledFont]

    label.adjustsFontForContentSizeCategory = true
    label.attributedText = NSAttributedString(string: "Hello", attributes: attributes)
  }
}

// MARK: - Attributed text with image

class ViewController3: UIViewController {

  @IBOutlet var label: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    let font = UIFont(name: "Times New Roman", size: 20)!
    let fontMetrics = UIFontMetrics(forTextStyle: .title3)
    let scaledFont = fontMetrics.scaledFont(for: font)

    let attachment = NSTextAttachment()
    attachment.image = UIImage(named: "TextArrow")
    attachment.adjustsImageSizeForAccessibilityContentSizeCategory = true

    let attributes: [NSAttributedString.Key: Any] = [.font: scaledFont]
    let attributedText = NSMutableAttributedString(string: "Three ", attributes: attributes)
    attributedText.append(NSAttributedString(attachment: attachment))

    label.adjustsFontForContentSizeCategory = true
    label.attributedText = attributedText
  }
}

// MARK: - TraitCollectionDidChange

class ViewController4: UIViewController {

  @IBOutlet var label: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    let font = UIFont(name: "Times New Roman", size: 20)!
    let fontMetrics = UIFontMetrics(forTextStyle: .title3)
    let scaledFont = fontMetrics.scaledFont(for: font)

    label.font = scaledFont
    label.adjustsFontForContentSizeCategory = true
    label.text = "Hello"
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)

    if traitCollection.preferredContentSizeCategory > .accessibilityMedium {
      label.textColor = .red
    } else {
      label.textColor = .black
    }
  }
}
