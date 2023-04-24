# frozen_string_literal: true

module Api
  module V1
    module Admin
      class CustomersController < ApplicationController
        before_action :set_customer,
                      only: %i[show update destroy products]

        def index
          collection = Customer.all
          render json: parsed_response(object: collection)
        end

        def show
          render json: parsed_response
        end

        def create
          @customer = Customer.build(customer_params)
          if customer.save
            render json: parsed_response, status: :created
          else
            render json: parsed_response(errors: customer.errors),
                   status: :unprocessable_entity
          end
        end

        def update
          if customer.update(customer_params)
            render json: parsed_response, status: :created
          else
            render json: parsed_response(errors: customer.errors),
                   status: :unprocessable_entity
          end
        end

        def destroy
          customer.destroy
          head :ok
        end

        def products
          collection = provider.products
          render json: ProductSerializer.new(
            collection
          ).serializable_hash.as_json
        end

        private

        attr_reader :customer

        def set_customer
          @customer = Customer.find(params[:id])
        end

        def parsed_response(object: customer, errors: {},
                            options: {})
          CustomerSerializer.new(
            object,
            options.merge!(errors)
          ).serializable_hash.to_json
        end

        def customer_params
          params.require(:customer).permit(
            :legal_name, :nickname, :first_name, :middle_name, :last_name,
            :maternal_last_name, :birth_date, :email, :phone, :gender, :rfc,
            :curp, :nationality, :customer_type,
            addresses_attributes: %i[
              street exterior_number interior_number neighborhood
              municipality city state zipcode country id _destroy
            ]
          )
        end
      end
    end
  end
end
