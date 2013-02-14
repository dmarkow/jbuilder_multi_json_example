class User < ActiveRecord::Base
  attr_accessible :name
  has_many :posts

  def self.json
    Jbuilder.encode do |json|
      json.users User.all do |user|
        json.name user.name
      end
    end
  end

  def self.json_with_post_names
    Jbuilder.encode do |json|
      json.users User.all do |user|
        json.name user.name

        # This works fine
        json.posts user.posts, :name
      end
    end
  end

  def self.json_with_full_posts
    Jbuilder.encode do |json|
      json.users User.all do |user|
        json.name user.name

        # This causes an error:
        # NoMethodError: undefined method `key?' for #<JSON::Ext::Generator::State:0x007fd75cb41a78>
        json.posts user.posts
      end
    end
  end
end
