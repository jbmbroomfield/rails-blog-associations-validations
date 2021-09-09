class Post < ActiveRecord::Base
    
    belongs_to :user
    has_many :post_tags
    has_many :tags, through: :post_tags

    validates :name, presence: true
    validates :content, presence: true

    def tag_ids=(tag_ids)
        tag_ids.each do |tag_id|
            tag = Tag.find(tag_id)
            self.tags << tag
        end
    end

end
