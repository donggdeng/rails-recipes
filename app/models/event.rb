class Event < ApplicationRecord
    validates_presence_of :name
    STATUS = %w(draft public private)
    validates_inclusion_of :status, in: STATUS

    before_validation :generate_friendly_id, on: :create

    belongs_to :category, optional: true
    has_many :tickets, dependent: :destroy, inverse_of: :event
    accepts_nested_attributes_for :tickets, allow_destroy: true, reject_if: :all_blank


    def to_param
        self.friendly_id
    end

    protected

    def generate_friendly_id
        self.friendly_id ||= SecureRandom.uuid
    end
end
