require 'rugged'
require 'fileutils'

class TerminalSession

  attr_accessor :repository

  # Public: Initialize a Terminal Session.
  #
  # path - Path where the repo should be created ('../repo.git').
  def initialize(path)
    @repository = Rugged::Repository.init_at(path, :bare)
  end

  # Public: Destroy a Terminal Session. This removes the repo from the file
  # system.
  def destroy
    FileUtils.rm_r(@repository.path)
  end

end