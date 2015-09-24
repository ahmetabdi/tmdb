require "./spec_helper"

describe Tmdb do

  context ".connect" do
    it "should return an Api instance" do
      tmdb = Tmdb.connect("8a110fc22fcdf12a8af827465574ffc9")
      tmdb.class.should eq(Tmdb::Api)
      tmdb.base_url.should eq("https://api.themoviedb.org/3/")
      tmdb.version.should eq(3)
      tmdb.language.should eq("en")
    end
  end

end
