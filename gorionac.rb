HOMEBREW_GORIONAC_VERSION='0.0.1'
class Gorionac < Formula
  homepage 'https://github.com/b4b4r07/gorionac'
  url 'https://github.com/b4b4r07/gorionac.git', :tag => "v#{HOMEBREW_GORIONAC_VERSION}"
  version HOMEBREW_GORIONAC_VERSION
  head 'https://github.com/b4b4r07/gorionac.git', :branch => 'master'

  depends_on 'go' => :build
  depends_on 'hg' => :build

  def install
    ENV['GOPATH'] = buildpath
    system 'go', 'get', 'github.com/daviddengcn/go-colortext'
    system 'go', 'get', 'github.com/cheggaaa/pb'
    system 'go', 'get', 'github.com/k0kubun/pp'
    system 'go', 'get', 'gopkg.in/yaml.v2'
    mkdir_p buildpath/'src/github.com/b4b4r07/gorionac'
    ln_s buildpath/'search', buildpath/'src/github.com/b4b4r07/gorionac/.'
    system 'go', 'build', '-o', 'gorionac'
    bin.install 'gorionac'
  end
end
