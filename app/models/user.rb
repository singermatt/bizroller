class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :confirmable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  after_save :send_welcome_email, :if => proc { |l| l.confirmed_at_changed? && l.confirmed_at_was.nil? }

  def send_welcome_email
     @user = self
     SignupMailer.signup_confirmation(@user).deliver
   end

  def self.from_omniauth(auth)
   	where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.skip_confirmation! 
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.email = auth.info.email
      user.name = auth.info.name
      user.nickname = auth.info.nickname
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.location = auth.info.location
      user.description = auth.info.description
      user.image = auth.info.image
      user.headline = auth.info.headline
      user.industry = auth.info.industry
      user.public_profile = auth.info.urls.public_profile
      user.num_connections = auth.extra.raw_info.numConnections
      user.current_position_industry_1 = auth["extra"]["raw_info"]["threeCurrentPositions"]["values"][0]["company"]["industry"] rescue " "
      user.current_position_company_name_1 = auth["extra"]["raw_info"]["threeCurrentPositions"]["values"][0]["company"]["name"] rescue " "
      user.current_position_title_1 = auth["extra"]["raw_info"]["threeCurrentPositions"]["values"][0]["title"] rescue " "
      user.current_position_industry_2 = auth["extra"]["raw_info"]["threeCurrentPositions"]["values"][1]["company"]["industry"] rescue " "
      user.current_position_company_name_2 = auth["extra"]["raw_info"]["threeCurrentPositions"]["values"][1]["company"]["name"] rescue " "
      user.current_position_title_2 = auth["extra"]["raw_info"]["threeCurrentPositions"]["values"][1]["title"] rescue " "
      user.current_position_industry_3 = auth["extra"]["raw_info"]["threeCurrentPositions"]["values"][2]["company"]["industry"] rescue " "
      user.current_position_company_name_3 = auth["extra"]["raw_info"]["threeCurrentPositions"]["values"][2]["company"]["name"] rescue " "
      user.current_position_title_3 = auth["extra"]["raw_info"]["threeCurrentPositions"]["values"][2]["title"] rescue " "

      user.past_position_industry_1 = auth["extra"]["raw_info"]["threePastPositions"]["values"][0]["company"]["industry"] rescue " "
      user.past_position_company_name_1 = auth["extra"]["raw_info"]["threePastPositions"]["values"][0]["company"]["name"] rescue " "
      user.past_position_title_1 = auth["extra"]["raw_info"]["threePastPositions"]["values"][0]["title"] rescue " "
      user.past_position_industry_2 = auth["extra"]["raw_info"]["threePastPositions"]["values"][1]["company"]["industry"] rescue " "
      user.past_position_company_name_2 = auth["extra"]["raw_info"]["threePastPositions"]["values"][1]["company"]["name"] rescue " "
      user.past_position_title_2 = auth["extra"]["raw_info"]["threePastPositions"]["values"][1]["title"] rescue " "
      user.past_position_industry_3 = auth["extra"]["raw_info"]["threePastPositions"]["values"][2]["company"]["industry"] rescue " "
      user.past_position_company_name_3 = auth["extra"]["raw_info"]["threePastPositions"]["values"][2]["company"]["name"] rescue " "
      user.past_position_title_3 = auth["extra"]["raw_info"]["threePastPositions"]["values"][2]["title"] rescue " "

  	end
        
  end
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

end
