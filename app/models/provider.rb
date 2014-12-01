class Provider < ActiveRecord::Base
  has_many :expertises, inverse_of: :provider
  has_many :subjects, through: :expertises
  has_many :speaks
  has_many :languages, through: :speaks

  has_many :educations, inverse_of: :provider
  has_many :degrees, through: :educations
  has_many :ratings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address1, presence: true
  validates :zip, presence: true
  validates :position, presence: true
  validates :organization, presence: true
  validates :resume, presence: true
  validates :rate, :numericality => {:greater_than => 0}
  validates :email, uniqueness: true
  #validate :must_have_an_expertise

  accepts_nested_attributes_for :expertises, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :educations, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :ratings,
      reject_if: proc { |attributes| (attributes['rating'].nil? || !(attributes['rating'].to_i > 0)) && attributes['comments'].blank? },
      :allow_destroy => true

  def self.search attributes
    @providers = all

    attributes.each do |key, value|
      case key.to_sym
      when :rate
        @providers = @providers.where('rate <= ?', value) unless value.empty?
      when :subject_ids
        @providers = @providers.includes(:expertises).where('expertises.subject_id in (?)', value) unless value.empty?
      when :language_ids
        @providers = @providers.includes(:speaks).where('speaks.language_id in (?)', value) unless value.empty?
      when :major
          @providers = @providers.includes(:educations).where('educations.major like ?', '%'+value+'%') unless value.empty?
      when :rating
        @providers = @providers.where('providers.id in (select providers.id from providers join ratings on providers.id = ratings.provider_id group by providers.id having avg(rating) >= ?)', value) unless value.empty?
      when :reviewer_ids
        @providers = @providers.includes(:ratings).where('ratings.user_id in (?)', value) unless value.empty?
      when :degree_ids
        @providers = @providers.includes(:educations).where('educations.degree_id in (?)', value) unless value.empty?
      when :resume
        @providers = @providers.where('resume ilike ?', '%'+value+'%')
      when :years_experience
        @providers = @providers.where('years_experience >= ?', value)
      when :provider
        if value.empty? then next end
        value[:expertises_attributes].each do |ea|
          @providers = @providers.includes(:expertises).where(
          'expertises.subject_id=? and expertises.experience>=?',
           ea[1]["subject_id"], ea[1]["experience"] )
        end
      else # unknown key (do nothing or raise error, as you prefer to)

      end
    end

    #provider = Provider.new attributes[:provider]

    return @providers
  end

  def average_rating
    ratings.empty? ? '' :
      ratings.inject(0.0) do |sum, el|
        if(!el.rating.nil? && el.rating > 0) then
          sum + el.rating
        else
          sum
        end
      end / ratings.size
  end

  private
  def must_have_an_expertise
    if expertises.nil? || expertises.size < 1
      errors.add(:expertises, :too_short, :count => 1)
    end
  end
end
