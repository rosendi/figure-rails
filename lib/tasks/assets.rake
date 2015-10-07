namespace :assets do
  task install: %w(install:npm install:tsd)

  namespace :install do
    task :npm do
      sh "npm install"
    end

    task :tsd do
      sh "tsd install && tsd rebundle"
    end
  end

  task :precompile => "install:tsd" do
    sh "gulp"
  end

  task :watch do
    sh "gulp watch"
  end

  task :reset do
    sh "gulp reset"
  end

  task :clean do
    # noop for Heroku
  end
end
