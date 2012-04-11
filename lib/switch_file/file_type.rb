module SwitchFile
  # A type of file within the project
  class FileType < Valuable
    has_value :command
    has_value :name
    has_value :path_generator
    has_value :path_regex
    has_value :shortcut

    def generate_open_command(source_path)
      "#{command} #{source_path.project.path}/#{path(source_path)}"
    end

    # Path of matching file to source_path, relative to source_path's project
    def path(source_path)
      path_generator.call(source_path.class_name)
    end
  end
end