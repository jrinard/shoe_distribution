class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  # validates(:name, :presence => true)
  # validates(:ingredients, :presence => true)
  # validates(:instructions, :presence => true)
  # validates(:ratings, :presence => true)


#   before_save(:capitalize_name)
#
# private
#
#   define_method(:capitalize_name) do
#     self.name = name.split.map(&:capitalize).join(" ")
#   end
end
