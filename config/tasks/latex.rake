namespace :latex do
  desc 'Rendering pdf with xelatex'
  task :resume do
    on roles(:latex) do |host|
      execute "cd '#{release_path}';xelatex resume.tex"
      info "Host #{host} (#{host.roles.to_a.join(', ')}):\t#{capture(:uptime)}"
    end
  end
  task :symlink do
    on roles(:latex) do |host|
      execute "ln -s ~/resume.pdf /home/deploy/portfolio/shared/public/resume.pdf"
    end
  end
end