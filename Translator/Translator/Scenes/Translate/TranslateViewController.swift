//
//  TranslateViewController.swift
//  Translator
//
//  Created by 유혜빈 on 2023/01/11.
//

import UIKit
import SnapKit

final class TranslateViewController: UIViewController{
    private var translatorManager = TranslatorManager()
    
    private lazy var sourceLanguageButton: UIButton = {
        let button = UIButton()
        button.setTitle(translatorManager.sourceLanguage.title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 9.0
        
        button.addTarget(self, action: #selector(didTapSourceLanguageButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var targetLanguageButton: UIButton = {
        let button = UIButton()
        button.setTitle(translatorManager.targetLanguage.title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 9.0
        
        button.addTarget(self, action: #selector(didTapTargetLanguageButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        
        [sourceLanguageButton, targetLanguageButton].forEach{
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }()
    
   
    private lazy var resultBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 23.0, weight: .bold)
        label.textColor = UIColor.mainTintColor
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var resultBookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.addTarget(self, action: #selector(didTapBookmarkButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var resultCopyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "doc.on.doc"), for: .normal)
        button.addTarget(self, action: #selector(didTapCopyButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var sourceLabelBaseButton: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        let gesture = UITapGestureRecognizer(target: self,
                                             action: #selector(didTapSourceLabelBaseButton))
        view.addGestureRecognizer(gesture)
        
        return view
    }()
    
    private lazy var sourceLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Enter_text", comment: "텍스트 입력")
        label.font = .systemFont(ofSize: 23.0, weight: .semibold)
        label.textColor = .tertiaryLabel
        label.numberOfLines = 0
        
        return label
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
        setupViews()
    }
    
    @objc func didTapBookmarkButton() {
        guard let sourceText = sourceLabel.text,
              let translatedText = resultLabel.text,
              resultBookmarkButton.imageView?.image == UIImage(systemName: "bookmark")
        else {return}
        
        resultBookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        
        let currentBookmarks: [Bookmark] = UserDefaults.standard.bookmarks
        let newBookmark = Bookmark(
            sourceLanguage: translatorManager.sourceLanguage,
            translatedLanguage: translatorManager.targetLanguage,
            sourceText: sourceText,
            translatedText: translatedText
        )
        UserDefaults.standard.bookmarks = [newBookmark] + currentBookmarks
        print(UserDefaults.standard.bookmarks)
    }
    
    @objc func didTapCopyButton(){
        UIPasteboard.general.string = resultLabel.text
    }
    
    @objc func didTapSourceLabelBaseButton(){
        let vc = SourceTextViewController(delegate: self)
        present(vc, animated: true)
    }
    
    @objc func didTapSourceLanguageButton(){
        didTapLanguageButton(.source)
    }
    
    @objc func didTapTargetLanguageButton(){
        didTapLanguageButton(.target)
    }
    
    func didTapLanguageButton(_ type: Type) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        Language.allCases.forEach{ language in
            let action = UIAlertAction(title: language.title, style: .default){ [weak self] _ in
                switch type {
                case .source:
                    self?.translatorManager.sourceLanguage = language
                    self?.sourceLanguageButton.setTitle(language.title, for: .normal)
                case .target:
                    self?.translatorManager.targetLanguage = language
                    self?.targetLanguageButton.setTitle(language.title, for: .normal)
                }
            }
            alertController.addAction(action)
        }
        let cancelAction = UIAlertAction(
            title: NSLocalizedString("Cancel", comment: "취소하기"),
            style: .cancel,
            handler: nil
        )
        alertController.addAction(cancelAction)

        present(alertController, animated: true)
    }
}

extension TranslateViewController: SourceTextViewControllerDelegate{
    func didEnterText(_ sourceText: String){
        if sourceText == "" {return}
        
        sourceLabel.text = sourceText
        sourceLabel.textColor = .label
        
        translatorManager.translate(sourceText){[weak self] translatedText in
            self?.resultLabel.text = translatedText
        }
        
        resultBookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
    }
}

private extension TranslateViewController{
    func setupViews(){
        [
            buttonStackView,
            resultBaseView,
            resultLabel,
            resultBookmarkButton,
            resultCopyButton,
            sourceLabelBaseButton,
            sourceLabel
        ].forEach{
            view.addSubview($0)
        }
        
        let defaultSpacing: CGFloat = 16.0
        
        buttonStackView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(defaultSpacing)
            $0.height.equalTo(50.0)
        }
        
        resultBaseView.snp.makeConstraints{
            $0.top.equalTo(buttonStackView.snp.bottom).offset(defaultSpacing)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(resultBookmarkButton.snp.bottom).offset(defaultSpacing)
        }
        
        resultLabel.snp.makeConstraints{
            $0.top.leading.trailing.equalTo(resultBaseView).inset(24.0)
        }
        
        resultBookmarkButton.snp.makeConstraints{
            $0.top.equalTo(resultLabel.snp.bottom).offset(24.0)
            $0.leading.equalTo(resultLabel)
            $0.width.height.equalTo(40.0)
        }
        
        resultCopyButton.snp.makeConstraints{
            $0.top.equalTo(resultBookmarkButton.snp.top)
            $0.leading.equalTo(resultBookmarkButton.snp.trailing).inset(8.0)
            $0.width.height.equalTo(40.0)
        }
        
        sourceLabelBaseButton.snp.makeConstraints{
            $0.top.equalTo(resultBaseView.snp.bottom).offset(defaultSpacing)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(tabBarController?.tabBar.frame.height ?? 0.0) //MARK: 높이값 이상....
        }
        
        sourceLabel.snp.makeConstraints{
            $0.top.leading.trailing.equalTo(sourceLabelBaseButton).inset(24.0)
        }
    }
}
