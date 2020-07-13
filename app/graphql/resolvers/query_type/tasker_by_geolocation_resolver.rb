module Resolvers
  module QueryType
    class TaskerByGeolocationResolver < GraphQL::Schema::Resolver
      description "List of specific tasker by geolocation"

      argument :lng, String, required: true
      argument :lat, String, required: true
      argument :service_type_id, Integer, required: false
      argument :start_from, String, required: false
      argument :start_to, String, required: false

      type [Types::TaskerType], null: false

      def resolve(** args)
        return if args.nil?

        if Transaction.count >= 1
          Tasker.find_by_sql("SELECT taskers.id, taskers.first_name, taskers.last_name, taskers.email, taskers.lat, taskers.lng,
            taskers.image, ((ACOS(SIN(#{args[:lat].to_d} * PI() / 180)
            * SIN(taskers.lat * PI() / 180) + COS(#{args[:lat].to_d} * PI() / 180)
            * COS(taskers.lat * PI() / 180)
            * COS((#{args[:lng].to_d} - taskers.lng) * PI() / 180)) * 180 / PI()) * 60 * 1.1515)
            AS distance FROM taskers
            INNER JOIN featured_skills
            ON featured_skills.tasker_id = taskers.id
            AND featured_skills.service_type_id = '#{args[:service_type_id]}'
            INNER JOIN transactions
            ON transactions.tasker_id = taskers.id
            WHERE (transactions.start_from = '#{args[:start_from]}' OR transactions.start_to = '#{args[:start_to]}')
            NOT IN (SELECT transactions.start_from OR transactions.start_to)
            HAVING distance <='20' ORDER BY distance ASC LIMIT 0,10")
        else
          Tasker.find_by_sql("SELECT taskers.id, taskers.first_name, taskers.last_name, taskers.email, taskers.lat, taskers.lng,
            taskers.image, ((ACOS(SIN(#{args[:lat].to_d} * PI() / 180)
            * SIN(taskers.lat * PI() / 180) + COS(#{args[:lat].to_d} * PI() / 180)
            * COS(taskers.lat * PI() / 180)
            * COS((#{args[:lng].to_d} - taskers.lng) * PI() / 180)) * 180 / PI()) * 60 * 1.1515)
            AS distance FROM taskers
            INNER JOIN featured_skills
            ON featured_skills.tasker_id = taskers.id
            AND featured_skills.service_type_id = '#{args[:service_type_id]}'
            HAVING distance <='20' ORDER BY distance ASC LIMIT 0,10")
        end
      end
    end
  end
end
