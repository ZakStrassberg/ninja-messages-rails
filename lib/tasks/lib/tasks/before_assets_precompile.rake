task :before_assets_precompile do
  system('npm install bower')
  system(`(cd /tmp && curl -O https://heroku-buildpack-nodejs.s3.amazonaws.com/nodejs-0.8.19.tgz)`)
  system(`(mkdir -p bin/nodejs && cd bin/nodejs && tar xzf /tmp/nodejs-0.8.19.tgz)`)
  system(`(cd bin && ln -s nodejs/bin/node node)`)
  system(`node bin/nodejs/bin/npm install`)
end

Rake::Task['assets:precompile'].enhance ['before_assets_precompile']