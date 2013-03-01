require "cuba"
require "rack/protection"
require "securerandom"
require "cuba/render"


Cuba.use Rack::Session::Cookie, :secret => SecureRandom.hex(64)
Cuba.use Rack::Protection
Cuba.plugin Cuba::Render

Cuba.define do
  on get do
    on "index" do
      res.write render("views/layout.haml") { render("views/index.haml") }
    end

    on root do
      res.redirect "/index"
    end
  end
end
