//
//  KeyboardCell.swift
//  Wordle
//
//  Created by Mari Batilando on 2/12/23.
//

import UIKit

class KeyboardCell: UICollectionViewCell {

  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var labelContainerView: UIView!
  private var string: String!
  var didSelectString: ((String) -> Void)!

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapString))
    contentView.addGestureRecognizer(tapGestureRecognizer)
  }

  func configure(with string: String) {
    labelContainerView.layer.cornerRadius = 4.0
    labelContainerView.backgroundColor = .gray
    /* Exercise 2:
      1. Assign the argument `string` to the `self.string` private property (see line 14)
      2. Change the text of the label to the value of the passed in string
        Tip: Command + click into the UILabel type to see its definition and find out what property to set
      Checkpoint: After finishing this exercise, you should now be able to see the keyboard laid out on the screen! If it's not working, check your work on exercises 1 & 2.
    */
    // Step 1: Assign the argument `string` to the `self.string` private property
    self.string = string

    // Step 2: Change the text of the label to the value of the passed-in string
    label.text = string
  }

  // Exercise 5: Call the `didSelectString` closure and pass in the string this cell holds (see line 14)
  // Checkpoint: After finishing this exercise, you should now be able to tap on a keyboard cell and have the letter shown on the board! If it's not working, check your work on exercises 3,4, and 5.
  @objc private func didTapString() {
    // START YOUR CODE HERE
    UIView.animate(withDuration: 0.1, animations: {
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    }, completion: { _ in
        UIView.animate(withDuration: 0.1) {
            self.transform = CGAffineTransform.identity
        }
    })
    // Call the `didSelectString` closure and pass in the string this cell holds
    didSelectString?(string)
    // END YOUR CODE HERE
  }
}
