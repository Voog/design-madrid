module.exports = function(grunt) {
  'use strict';

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    // Removes old files.
    clean: {
      reset: {
        src: ['assets', 'images', 'javascripts', 'stylesheets']
      },

      remove: {
        src: ['sources/components/tmp']
      }
    },

    modernizr_builder: {
      build: {
        options: {
          config: 'modernizr-config.json',
          dest: 'javascripts/modernizr.js',
          uglify: false
        }
      }
    },

    // Concatenates the javascript source files to the javascripts folder.
    concat: {
      build: {
        src: [
          'bower_components/jquery/dist/jquery.js',
          'sources/javascripts/concat/*.js'
        ],
        dest: 'javascripts/application.js'
      }
    },

    // Minifies the javascript files.
    uglify: {
      build: {
        files: [{
          expand: true,
          cwd: 'javascripts/',
          src: [
            '*.js',
            '!*.min.js'
          ],
          dest: 'javascripts/',
          ext: '.min.js'
        }]
      }
    },

    // Compiles the stylesheet files.
    sass: {
      build_main: {
        options: {
          style: 'expanded',
          sourcemap: 'none'
        },
        files: [{
          expand: true,
          cwd: 'sources/stylesheets',
          src: 'main.scss',
          dest: 'stylesheets/',
          ext: '.css'
        }]
      },

      build_components: {
        options: {
          style: 'expanded',
          sourcemap: 'none'
        },
        files: [{
          expand: true,
          cwd: 'sources/components/',
          src: '*.scss',
          dest: 'sources/components/tmp',
          ext: '.css'
        }]
      }
    },

    postcss: {
      options: {
        processors: [
          require('autoprefixer')({browsers: 'last 4 versions'})
        ]
      },
      dist: {
        src: [
          'stylesheets/*.css',
          'stylesheets/!*.min.css'
        ]
      }
    },

    // Minifies the stylesheet files.
    cssmin: {
      build: {
        expand: true,
        cwd: 'stylesheets/',
        src: [
          '*.css',
          '!*.min.css'
        ],
        dest: 'stylesheets/',
        ext: '.min.css'
      }
    },

    // Minifies the image files.
    imagemin: {
      build_images: {
        files: [{
          expand: true,
          cwd: 'sources/images/minify',
          src: '*.{png,jpg,gif}',
          dest: 'images/'
        }]
      },

      build_assets: {
        files: [{
          expand: true,
          cwd: 'sources/assets/minify',
          src: '*.svg',
          dest: 'assets/'
        }]
      }
    },

    // Copys the files from the source folders to the layout folders.
    copy: {
      assets: {
        files: [
          {
            expand: true,
            cwd: 'sources/assets/copy',
            src: '*',
            dest: 'assets/'
          }
        ]
      },

      images: {
        files: [
          {
            expand: true,
            cwd: 'sources/images/copy',
            src: '*',
            dest: 'images/'
          }
        ]
      },

      javascripts: {
        files: [
          {
            expand: true,
            cwd: 'sources/javascripts/copy',
            src: '*',
            dest: 'javascripts/'
          }
        ]
      },

      components: {
        files: [
          {
            expand: true,
            cwd: 'sources/components/tmp',
            src: '*.css',
            dest: 'components',
            ext: '.tpl'
          }
        ]
      }
    },

    // Appends common required parts to files. Unfortunately this task script is
    // not allowing to insert "*.ext" as input and output so each file must be
    // added/removed manually.
    file_append: {
      template_editor: {
        files: [
          {
            prepend: "{% comment %}\n================================================================================\nTEMPLATE DESIGN EDITOR STYLES.\nAdds template design editor style overrides.\n================================================================================\n{% endcomment %}\n<style data-voog-style>\n",
            append: "</style>\n\n{{ site.style_tag }}",
            input: 'components/template-design.tpl',
            output: 'components/template-design.tpl'
          }
        ]
      }
      // Template for adding new files. Uppercase values should be changed.
      // NB! Don't forget to add comma after previous file settings.
      // NB! Add the new task to "watch" list also.

      // NAME_OF_THE_TASK: {
      //   files: [
      //     {
      //       prepend: "{% comment %}\n================================================================================\nTEMPLATE DESIGN EDITOR STYLES.\nAdds template design editor style overrides.\n================================================================================\n{% endcomment %}\n<style type=\"text/css+voog\" data-edy-stylesheet=\"true\">\n",
      //       append: "</style>",
      //       input: 'FILE_PATH',
      //       output: 'FILE_PATH'
      //     }
      //   ]
      // }
    },

    // Executes the Voog Kit toolkit manifest generation and file upload commands.
    exec: {
      kitmanifest: {
        cmd: function(file) {
          return 'kit manifest';
        }
      },

      kit: {
        cmd: function(file) {
          if (grunt.option('site')) {
            return 'kit push -s ' + grunt.option('site') + ' ' + file;
          } else {
            return 'kit push ' + file;
          }
        }
      }
    },

    // Watches the project for changes and recompiles the output files.
    watch: {
      modernizr: {
        files: 'modernizr-config.json',
        tasks: ['modernizr_builder:build']
      },

      js_copy: {
        files: 'sources/javascripts/copy/*.js',
        tasks: ['copy:javascripts', 'exec:kitmanifest']
      },

      js_concat: {
        files: 'sources/javascripts/concat/*.js',
        tasks: ['concat:build', 'uglify:build', 'exec:kitmanifest']
      },

      css_main: {
        files: [
          'sources/stylesheets/*.scss',
          'sources/stylesheets/*/*.scss'
        ],
        tasks: ['sass:build_main', 'postcss', 'cssmin:build', 'exec:kitmanifest']
      },

      template_design: {
        files: 'sources/components/*.scss',
        tasks: ['sass:build_components', 'copy:components', 'clean:remove', 'file_append:template_editor', 'exec:kitmanifest']
      },

      img_copy: {
        files: 'sources/images/copy/*',
        tasks: [ 'copy:images', 'exec:kitmanifest']
      },

      img_minify: {
        files: 'sources/images/minify/*',
        tasks: ['imagemin:build_images', 'exec:kitmanifest']
      },

      assets_copy: {
        files: 'sources/assets/copy/*',
        tasks: ['copy:assets', 'exec:kitmanifest']
      },

      assets_minify: {
        files: 'sources/assets/minify/*',
        tasks: ['imagemin:build_assets', 'exec:kitmanifest']
      },

      voog: {
        files: ['javascripts/*.js', 'stylesheets/*.css', 'layouts/*.tpl', 'components/*.tpl'],
        options: {
          spawn: false
        }
      }
    },
  });

  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-modernizr-builder');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-postcss');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-file-append');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-exec');

  grunt.registerTask('default', ['clean:reset', 'modernizr_builder', 'concat', 'uglify', 'sass', 'postcss', 'cssmin', 'imagemin', 'copy', 'file_append', 'clean:remove']);

  grunt.event.on('watch', function(action, filepath, target) {
    if (target == 'voog') {
      if (action == 'added' || action == 'deleted') {
        grunt.task.run(['exec:kitmanifest']);
      }
      if (grunt.file.exists('.voog')) {
        if (action != 'deleted') {
          grunt.task.run(['exec:kit:' + filepath]);
        }
      }
    }
  });
};
