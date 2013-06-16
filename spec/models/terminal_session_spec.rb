require 'spec_helper'
require 'fileutils'

describe TerminalSession do
  subject(:terminal_session) { described_class.new(path) }
  let(:repository) { terminal_session.repository }
  let(:path) { "#{Rails.root}tmp/repo.git" }

  after do
    if File.exists?(path)
      FileUtils.rm_r(path)
    end
  end

  it 'initializes a repository for the path given' do
    expect(repository.path.chop).to eq(path)
  end

  describe "#destroy" do
    it 'removes the git repository' do
      terminal_session.destroy
      expect(File.exists?(path)).to be_false
    end
  end

end