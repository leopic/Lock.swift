// EnterpriseView.swift
//
// Copyright (c) 2016 Auth0 (http://auth0.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

public class EnterpriseView: UIView, Form {
    private var inputField: InputField
    private var stackView: UIStackView

    var value: String? {
        get {
            return self.inputField.text
        }
        set {
            self.inputField.text = newValue
        }
    }

    var type: InputField.InputType = .Email {
        didSet {
            self.inputField.type = self.type
        }
    }

    var returnKey: UIReturnKeyType = .Done {
        didSet {
            self.inputField.returnKey = self.returnKey
        }
    }

    var onValueChange: (InputField) -> () = { _ in } {
        didSet {
            self.inputField.onTextChange = self.onValueChange
        }
    }

    var onReturn: (InputField) -> () {
        get {
            return self.inputField.onReturn
        }
        set {
            self.inputField.onReturn = newValue
        }
    }

    func needsToUpdateState() {
        self.inputField.needsToUpdateState()
    }

    // MARK:- Initialisers

    required override public init(frame: CGRect) {
        self.inputField = InputField()
        self.stackView = UIStackView(arrangedSubviews: [inputField])
        super.init(frame: frame)
        self.layoutForm()
    }

    public convenience init() {
        self.init(frame: CGRectZero)
    }

    public required convenience init?(coder aDecoder: NSCoder) {
        self.init(frame: CGRectZero)
    }

    // MARK:- Layout

    private func layoutForm() {
        self.addSubview(self.stackView)

        constraintEqual(anchor: self.stackView.leftAnchor, toAnchor: self.leftAnchor)
        constraintEqual(anchor: self.stackView.topAnchor, toAnchor: self.topAnchor)
        constraintEqual(anchor: self.stackView.rightAnchor, toAnchor: self.rightAnchor)
        constraintEqual(anchor: self.stackView.bottomAnchor, toAnchor: self.bottomAnchor)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false

        self.stackView.alignment = .Fill
        self.stackView.axis = .Vertical
        self.stackView.distribution = .EqualCentering

        inputField.type = self.type
        inputField.returnKey = self.returnKey
    }

    public override func intrinsicContentSize() -> CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: 244)
    }
}
