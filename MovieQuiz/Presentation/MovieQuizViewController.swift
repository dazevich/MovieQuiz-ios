import UIKit

final class MovieQuizViewController: UIViewController, QuestionFactoryDelegate {
    
    private let questionsAmount: Int = 10
    private var questionFactory: QuestionFactoryProtocol?
    private var currentQuestion: QuizQuestion?
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var noButton: UIButton!
    @IBOutlet private weak var yesButton: UIButton!
    
    private var currentIndex: Int = 0 {
        didSet {
            if(currentIndex >= questionsAmount) {
                show(quiz: QuizResultsViewModel(
                    title: "Этот раунд закончен",
                    text: "Ваш результат: \(correctAnswers) из \(questionsAmount)",
                    buttonText: "Сыграть еще раз"));
            } else {
                questionFactory?.requestNextQuestion()
            }
        }
    }
    private var correctAnswers: Int = 0;
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        questionFactory = QuestionFactory()
        guard var questionFactory = questionFactory else {return}
        questionFactory.delegate = self
        questionFactory.requestNextQuestion()
        imageView.layer.masksToBounds = true
    }
    
    // MARK: - QuestionFactoryDelegate
    func didReceiveNextQuestion(question: QuizQuestion?) {
        guard let question = question else {return}
        currentQuestion = question
        show(quiz: convert(model: question))
    }
    
    // MARK: - Methods
    private func convert(model: QuizQuestion) -> QuizStepViewModel {
        let image = UIImage(named: model.image)!
        let question = model.text
        let questionNumber = "\(currentIndex+1)/\(questionsAmount)";
        
        return QuizStepViewModel(image: image, question: question, questionNumber: questionNumber)
    }
    
    private func show(quiz step: QuizStepViewModel) {
        imageView.layer.borderWidth = 0
        imageView.layer.borderColor = nil
        imageView.layer.masksToBounds = true
        counterLabel.text = step.questionNumber
        imageView.image = step.image
        textLabel.text = step.question
    }
    
    private func show(quiz result: QuizResultsViewModel) {
        imageView.layer.borderWidth = 0
        imageView.layer.borderColor = nil
        imageView.layer.masksToBounds = true
        let alert = UIAlertController(
            title: result.title,
            message: result.text,
            preferredStyle: .alert)
        let action = UIAlertAction(title: result.buttonText, style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.currentIndex = 0
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true)
    }
    
    private func showAnswerResult(isCorrect: Bool) {
        yesButton.isEnabled = false
        noButton.isEnabled = false
    
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        
        if(isCorrect) {
            correctAnswers += 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            self.yesButton.isEnabled = true
            self.noButton.isEnabled = true
            self.currentIndex += 1
        }
    }
    
    
    
    // MARK: - Callbacks
    @IBAction private func yesBtnPressed(_ sender: Any) {
        guard let question = currentQuestion else {return}
        let correctAnswer = question.correctAnswer;
        showAnswerResult(isCorrect: correctAnswer);
        
    }
    
    @IBAction private func noBtnPressed(_ sender: Any) {
        guard let question = currentQuestion else {return}
        let correctAnswer = question.correctAnswer;
        showAnswerResult(isCorrect: !correctAnswer);
    }
}
