module Fanboy
  class Server < Sinatra::Base
    get "*" do
      puts params.inspect
      "Yessir"
    end
  end
end
