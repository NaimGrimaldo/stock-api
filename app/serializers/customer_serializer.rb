# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id                 :uuid             not null, primary key
#  legal_name         :string
#  nickname           :string           not null
#  first_name         :string
#  middle_name        :string
#  last_name          :string
#  maternal_last_name :string
#  birth_date         :date
#  email              :string
#  phone              :string
#  gender             :integer
#  rfc                :string
#  curp               :string
#  nationality        :string
#  customer_type      :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  deleted_at         :datetime
#
class CustomerSerializer
  include JSONAPI::Serializer
  attributes :legal_name, :nickname, :name, :first_name, :middle_name,
             :last_name, :maternal_last_name, :birth_date, :email, :phone,
             :gender, :rfc, :curp, :nationality, :nationality, :customer_type
end
