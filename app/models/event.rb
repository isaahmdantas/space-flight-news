class Event < ApplicationRecord
    acts_as_paranoid
    
    has_and_belongs_to_many :articles, join_table: "articles_launches", dependent: :destroy

    validates :provider, presence: true 


    after_create :set_id

    def set_id 
      if _id.blank? 
        self._id = SecureRandom.uuid
        self.save!
      end
    end

    def as_json(options = {})
      super(options.merge({
        except: %i[
          created_at updated_at deleted_at id _id
        ] 
      })).merge('id' => self._id)
    end
end
