class Graph < ApplicationRecord
  has_many :user_graphs
  has_many :users, through: :user_graphs
end
