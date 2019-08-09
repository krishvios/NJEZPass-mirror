//
//  DropDownTblView.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 16/04/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import UIKit

class DropDownTblView: UITableView, UITableViewDataSource, UITableViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var dropDownData: [String]!
    var dropDownTextField: UITextField!
    let cellIdentifier = "Cell"

    init(dropDownData: [String], dropdownField: UITextField) {
     super.init(frame: CGRect.zero, style: UITableView.Style.plain)
        self.dropDownData = dropDownData
        self.dropDownTextField = dropdownField

        self.register(DropDownCell.self, forCellReuseIdentifier: cellIdentifier)
        self.delegate = self
        self.dataSource = self

        DispatchQueue.main.async {
            if dropDownData.count > 0 {
                self.dropDownTextField.text = self.dropDownData[0]
                self.dropDownTextField.isEnabled = true
            } else {
                self.dropDownTextField.text = nil
                self.dropDownTextField.isEnabled = false
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dropDownData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DropDownCell {
            cell.dropDownLabel.text = self.dropDownData[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let currentCell = tableView.cellForRow(at: indexPath) as? DropDownCell, let user = currentCell.dropDownLabel.text else {
            return
        }
        self.dropDownTextField.text = user
    }
}
class DropDownCell: UITableViewCell {

    // MARK: - Properties
    var dropDownLabel = UILabel()

    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    private func setupComponents() {
        dropDownLabel.textColor = UIColor.black
        contentView.addSubview(dropDownLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            dropDownLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dropDownLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dropDownLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            dropDownLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            dropDownLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            dropDownLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5)
            ])

        dropDownLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}
