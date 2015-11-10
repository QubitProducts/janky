module Janky
  module Notifier
    class ChatService
      def self.completed(build)
        status = build.green? ? "was successful" : "failed"
        color = build.green? ? "green" : "red"

        message = "Deployment #%s by %s (%s) of %s/%s to %s %s (%ss) %s" % [
          build.number,
          build.user,
          build.short_sha1,
          build.repo_name,
          build.branch_name,
          build.parameters["ENVIRONMENT"],
          status,
          build.duration,
          build.web_url
        ]

        ::Janky::ChatService.speak(message, build.room_id, {:color => color, :build => build})
        if build.room_id != build.repository.room_id
          ::Janky::ChatService.speak(message, build.repository.room_id, {:color => color, :build => build})
        end
      end
    end
  end
end
