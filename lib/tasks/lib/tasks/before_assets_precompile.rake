task :before_assets_precompile do
  system('npm install bower')
end

Rake::Task['assets:precompile'].enhance ['before_assets_precompile']