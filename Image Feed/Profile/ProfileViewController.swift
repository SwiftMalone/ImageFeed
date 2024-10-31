import UIKit

final class ProfileViewController: UIViewController {
    private let profilePhotoView: UIImageView = {
        let image = UIImage(named: "avatar")
        let view = UIImageView(image: image)
        return view
    }()
    private let logOutButton: UIButton = {
        let button = UIButton.systemButton(
            with: UIImage(systemName: "ipad.and.arrow.forward")!,
            target: self,
            action: #selector(Self.didTapLogoutButton)
        )
        button.tintColor = UIColor(named: "YPRed")
        return button
    }()
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        label.textColor = .white
        label.text = "Екатерина Новикова"
        label.numberOfLines = 0
        return label
    }()
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(named: "YPGray")
        label.text = "@ekaterina_nov"
        label.numberOfLines = 0
        return label
    }()
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .white
        label.text = "Hello, world!"
        label.numberOfLines = 0
        return label
    }()
    
    private func addViewsToSuperView() {
        let viewsArray: [UIView] = [logOutButton, profilePhotoView, userNameLabel, tagLabel, statusLabel]
        viewsArray.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    private func setUserPickAndExitButtonConstraints() {
        NSLayoutConstraint.activate([
            profilePhotoView.widthAnchor.constraint(equalToConstant: 70),
            profilePhotoView.heightAnchor.constraint(equalToConstant: 70),
            profilePhotoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profilePhotoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            logOutButton.widthAnchor.constraint(equalToConstant: 44),
            logOutButton.heightAnchor.constraint(equalToConstant: 44),
            logOutButton.centerYAnchor.constraint(equalTo: profilePhotoView.centerYAnchor),
            view.trailingAnchor.constraint(equalTo: logOutButton.trailingAnchor, constant: 12)
        ])
    }
    
    private func setupLabelsConstraints() {
        NSLayoutConstraint.activate([
            userNameLabel.leadingAnchor.constraint(equalTo: profilePhotoView.leadingAnchor),
            userNameLabel.topAnchor.constraint(equalTo: profilePhotoView.bottomAnchor, constant: 8),
            view.trailingAnchor.constraint(greaterThanOrEqualTo: userNameLabel.trailingAnchor, constant: 16),
            tagLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            tagLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 8),
            view.trailingAnchor.constraint(greaterThanOrEqualTo: tagLabel.trailingAnchor, constant: 16),
            statusLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            statusLabel.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: 8),
            view.trailingAnchor.constraint(greaterThanOrEqualTo: statusLabel.trailingAnchor, constant: 16)
        ])
    }
    
    private func setupConstraints() {
        setUserPickAndExitButtonConstraints()
        setupLabelsConstraints()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewsToSuperView()
        setupConstraints()
    }
    
    @objc
    private func didTapLogoutButton() {
        for view in view.subviews {
            if view is UILabel {
                view.removeFromSuperview()
            }
        }
    }
}
