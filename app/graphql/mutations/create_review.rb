module Mutations
  # mutation for creating review
  class CreateReview < BaseMutation
    description "Create Review"
    argument :rating, Integer, required: true
    argument :comment, String, required: true
    argument :customer_id, Integer, required: true
    argument :tasker_id, Integer, required: true
    argument :service_type_id, Integer, required: true
    argument :transaction_id, Integer, required: true
 
    field :response, String, null: true
    field :status_code, Integer, null: false

    def resolve(** args)
      review = Review.new(
        rating: args[:rating].to_f,
        comment: args[:comment],
        customer_id: args[:customer_id],
        tasker_id: args[:tasker_id],
        service_type_id: args[:service_type_id],
      )

      transaction = Transaction.find(args[:transaction_id])
      transaction.review = true

      if review.save && transaction.save
        { response: "Review Created", status_code: 200 }
      else
        { response: review.errors.full_messages.join(""), status_code: 422 }
      end
    end
  end
end
