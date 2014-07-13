# config valid only for Capistrano 3.1
lock "3.2.1"

set :application,   "service_skeleton"
set :repo_url,      "https://github.com/doejo/service-skeleton.git"
set :branch,        "master"
set :deploy_to,     "/home/apps/#{fetch(:application)}"
set :linked_files,  %w{config/database.yml .env}
set :linked_dirs,   %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle}
set :keep_releases, 10

namespace :foreman do
  desc "Export application scripts"
  task :export do
    on roles(:app), in: :groups, limit: 3, wait: 10 do
      within release_path do
        execute :sudo, "bundle exec foreman export upstart /etc/init -a #{fetch(:application)} -u apps -l #{fetch(:shared_path)}/log"
      end
    end
  end

  desc "Restart application"
  task :restart do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      execute :sudo, "service #{fetch(:application)} start || sudo service #{fetch(:application)} restart"
    end
  end
end

namespace :deploy do
  after :publishing, "foreman:export"
  after :publishing, "foreman:restart"
end