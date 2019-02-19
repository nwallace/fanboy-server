module Fanboy
  module Spec
    module DBHelpers
      def cs_title
        Models::Title.find_by!(slug: "csgo")
      end
    end
  end
end
