module FixtureHelper
  def fixtures_path
    File.expand_path("../fixtures", __FILE__)
  end

  def fixture_path(path)
    File.join(fixtures_path, path)
  end

  def fixture(path)
    File.read(fixture_path(path))
  end
end