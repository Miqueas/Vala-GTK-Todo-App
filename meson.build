project('io.github.Miqueas.Vala-GTK-Todo-App', [ 'c', 'vala' ],
  version: '0.1.0',
  license: 'Zlib',
  meson_version: '>= 0.56.0'
)

# Allows using the 'with' keyword in Vala without warnings
add_project_arguments('--enable-experimental', language: 'vala')

adwaita = dependency('libadwaita-1', required: true)
gtk4 = dependency('gtk4', required: true)
gee = dependency('gee-0.8', required: true)

src = [
  'src/app.vala',
  'src/main.vala',
  'src/constants.vala',
  'src/models/task.vala',
  'src/widgets/header.vala',
  'src/widgets/task-row.vala',
  'src/widgets/app-window.vala',
  'src/widgets/tasks-view.vala',
  'src/widgets/bottom-bar.vala',
  'src/widgets/about-window.vala',
  'src/providers/tasks-provider.vala',
]

executable(meson.project_name(), src, 
  dependencies: [ gtk4, gee, adwaita ],
)