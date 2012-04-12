module SwitchFile
  # A type of file within the project
  class FileType < Valuable
    has_value :command
    has_value :name
    has_value :path_generator
    has_value :path_regex
    has_value :shortcut

    def generate_open_command(source)
      "#{command} #{source.project.path}/#{relative_path(source)}"
    end

    # Path of matching file to source, relative to source's project
    def relative_path(source)
      path_generator.call(source.class_name)
    end
  end
end