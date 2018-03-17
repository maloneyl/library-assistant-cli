source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "pry-byebug"
gem "dotenv"

gem "library_assistant", github: "maloneyl/library_assistant"
