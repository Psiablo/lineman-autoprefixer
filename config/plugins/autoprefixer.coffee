module.exports = (lineman) ->
  app = lineman.config.application

  files:
    autoprefixer:
      cwd: 'generated/css/'
      dest: 'generated/css/'
      src: '{,*/}*.css'

  config:
    loadNpmTasks: app.loadNpmTasks.concat('grunt-autoprefixer')

    prependTasks:
      dist: app.prependTasks.dist.concat('autoprefixer')

    autoprefixer:
      options:
        browsers: ['> 1%', 'last 2 versions', 'Firefox ESR', 'Opera 12.1']

      prefix:
        expand: true,
        cwd: '<%= files.autoprefixer.cwd %>'
        src: '<%= files.autoprefixer.src %>',
        dest: '<%= files.autoprefixer.dest %>'

    watch:
      css:
        tasks: app.watch.css.tasks.concat('autoprefixer')
      less:
        tasks: app.watch.less.tasks.concat('autoprefixer')
      sass:
        tasks: app.watch.sass.tasks.concat('autoprefixer')