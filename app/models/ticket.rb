class Ticket < ApplicationRecord
    before_save :default_values
    
    belongs_to :user, class_name: "User"
    has_one :survey, class_name: "Survey"

    has_many :comments, foreign_key: :ticket_id

    validates :title, presence: true
    validates :body, presence: true


    def default_values
        ticket_no = (0...8).map { (65 + rand(26)).chr }.join
        self.is_close ||= false
        self.ticket_no = ticket_no
      end

end
