module CopyFile
  def copy_file(from, to)
    FileUtils.mkdir_p(to)
    FileUtils.cp(from, to)
  end
end
