# config valid for current version and patch releases of Capistrano
lock "~> 3.15.0"

set :application, "juan-ted-api"
set :repo_url, "git@github.com:deguzman20/juan-ted-api.git"

set :use_sudo, false
set :stage, :development
set :deploy_to, "/home/deploy/public_html/juan-ted-api"

namespace :deploy do
  desc "Change HTML Symlink to relative path"
  task :create_symlink do
    on roles(:app) do
      # execute "ls -l"
      info "Modifying symlink to be relative"
      execute "rm -d #{current_path}"

      info "Deleted current symlink"
      execute "cd /home/deploy/public_html/juan-ted-api && ln -s /home/deploy/public_html/juan-ted-api/releases/#{File.basename release_path} current"
      info "Created relative current symlink"
    end
  end
end

namespace :uploads do
  task :update_image do
    # execute ""
    on roles(:app) do
      # execute "ln -s #{current_path}/public/uploads #{shared_path}/public/uploads"
      previous = capture("ls -Ct #{releases_path} | awk '{print $2}'").to_s.strip
      execute "cp -R #{releases_path}/#{previous}/public/uploads #{current_path}/public"
    end
  end
end

append :linked_files, "config/database.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

after :deploy, "deploy:create_symlink"
after "deploy", "uploads:update_image"
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
