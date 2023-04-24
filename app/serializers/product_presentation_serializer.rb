# frozen_string_literal: true

# == Schema Information
#
# Table name: product_presentations
#
#  id              :uuid             not null, primary key
#  name            :string           not null
#  description     :string           not null
#  factor_per_item :integer          default(1), not null
#  nickname        :string
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class ProductPresentationSerializer
  include JSONAPI::Serializer
  attributes :name, :nickname, :factor_per_item, :description
end
