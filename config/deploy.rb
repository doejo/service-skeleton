# config valid only for Capistrano 3.1
lock "3.2.1"

set :application,   "TODO: application name goes here"
set :repo_url,      "TODO: repo url goes here"
set :branch,        "master"
set :deploy_to,     "/home/apps/#{fetch(:application)}"
set :linked_files,  %w{config/database.yml .env}
set :keep_releases, 10

namespace :deploy do
  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join("tmp/restart.txt")
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, "cache:clear"
      # end
    end
  end
end