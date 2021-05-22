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
            INNER JOIN featured_skills AS fs
            ON fs.tasker_id = taskers.id
            AND fs.service_type_id = '#{args[:service_type_id].to_i}'
              WHERE
                NOT EXISTS
              (SELECT * FROM transactions AS tr WHERE tr.tasker_id = fs.tasker_id AND
              (
                (tr.to >= '#{args[:start_from]}' AND tr.to <= '#{args[:start_to]}')
                OR (tr.from >= '#{args[:start_from]}' AND tr.from <= '#{args[:start_to]}')
              ))
            HAVING distance <='20' ORDER BY distance ASC LIMIT 0,10").uniq

        else
          Tasker.find_by_sql("SELECT taskers.id, taskers.first_name, taskers.last_name, taskers.email, taskers.lat, taskers.lng,
            taskers.image, ((ACOS(SIN(#{args[:lat].to_d} * PI() / 180)
            * SIN(taskers.lat * PI() / 180) + COS(#{args[:lat].to_d} * PI() / 180)
            * COS(taskers.lat * PI() / 180)
            * COS((#{args[:lng].to_d} - taskers.lng) * PI() / 180)) * 180 / PI()) * 60 * 1.1515)
            AS distance FROM taskers
            INNER JOIN featured_skills
            ON featured_skills.tasker_id = taskers.id
            AND featured_skills.service_type_id = '#{args[:service_type_id].to_i}'
            HAVING distance <='20' ORDER BY distance ASC LIMIT 0,10").uniq
        end
      end
    end
  end
end
