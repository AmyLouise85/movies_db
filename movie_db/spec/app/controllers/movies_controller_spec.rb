require 'spec_helper'

RSpec.describe "/movies" do
  before do
    @movie = Movie.create!(title: "Rambo", year: 1982, description: "Sylvester Stallone goes mental in the woods")
  end
  describe "viewing a movie" do
    it "should show the movie title" do
      get "/movies/#{@movie.id}"
      expect(last_response.body).to include @movie.title
    end
    it "should show the movie description and year" do
      get "/movies/#{@movie.id}"
      expect(last_response.body).to include @movie.year.to_s
      expect(last_response.body).to include @movie.description
    end
  end
end
